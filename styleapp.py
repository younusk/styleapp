from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# Home route to display the questions
@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        # Collect answers from the form
        answers = {
            'style': request.form['style'],
            'color': request.form['color'],
            'occasion': request.form['occasion'],
            'fabric': request.form['fabric']
        }
        return redirect(url_for('results', style=answers['style'], color=answers['color'], occasion=answers['occasion'], fabric=answers['fabric']))

    return render_template('form.html')

# Results route to display the user's preferences
@app.route('/results')
def results():
    style = request.args.get('style')
    color = request.args.get('color')
    occasion = request.args.get('occasion')
    fabric = request.args.get('fabric')
    return render_template('results.html', style=style, color=color, occasion=occasion, fabric=fabric)

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000,debug=True)
