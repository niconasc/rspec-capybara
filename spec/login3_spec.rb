describe "Login 3", :login3 do

        before(:each) do
            visit "/access"
    end
    
    it "login com sucesso" do

        login_form = find('#login')

        login_form.find('input[name=username]').set "stark"
        login_form.find('input[name=password]').set "jarvis!"
        

        click_button "Entrar"

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it "login com sucesso within" do

        within('#login') do
            find('input[name=username]').set "stark"
            find('input[name=password]').set "jarvis!"
        end

        click_button "Entrar"

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it "cadastro com sucesso within" do

        within('#signup') do
            find('input[name=username]').set "nicolai"
            find('input[name=password]').set "123456"
        end

        click_link "Criar Conta"

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end
end