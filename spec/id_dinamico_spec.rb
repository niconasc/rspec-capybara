describe "IDS dinamicos", :ids_dinamicos do
    
    before(:each) do
        visit "/access"
    end
    

    it "cadstro" do

        find('input[id$=UsernameInput]').set 'nicolai'
        find('input[id^=PasswordInput]').set '123123'
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'  
        
    end
end
