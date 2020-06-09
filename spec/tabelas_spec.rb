describe "Tabelas", :table do

    before do
        visit '/tables'
    end
    
    it "deve exibir o salário do Tony Stark" do
        atores = all('table tbody tr')
        stark = atores.detect{ |ator| ator.text.include?("Robert Downey Jr")}
        expect(stark.text).to include "10.000.000"  
    end
    
    it "deve exibir o salário do Vin Diesel" do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content  "10.000.00"  
    end
    
    it "deve exibir velozes", :movie do
        diesel = find('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text

        expect(movie).to eql  "Velozes e Furiosos"  
    end

    it "deve trazer instagram do Cris Evans", :evans do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text

        expect(insta).to eql "@teamcevans"  
    end

    it "deve selecionar Cris Pratt para remoção", :remove do
        cris = find('table tbody tr', text: 'Chris Pratt')
        cris.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'  
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    end

    it "deve selecionar Cris Pratt para edição", :remove do
        cris = find('table tbody tr', text: 'Chris Pratt')
        cris.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'  
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    end
end
