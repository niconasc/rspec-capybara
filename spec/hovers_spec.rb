describe "Mouse Hover", :hovers do
    before(:each) do
        visit "/hovers"
    end

    it "Quando passo o mouse sobre o Blade", :blade do
        # CSS utilizado quando contém
        blade = find('img[alt*=Blade]')
        blade.hover

        expect(page).to have_content 'Nome: Blade'  
    end

    it "Quando passo o mouse sobre o Pantera Negra", :pantera do
        # CSS utilizado quando inicia com a palavra
        blade = find('img[alt^=Pantera]')
        blade.hover

        expect(page).to have_content 'Nome: Pantera Negra'  
    end

    it "Quando passo o mouse sobre o Homem Aranha", :aranha do
        blade = find('img[alt$=Aranha]')
        blade.hover

        expect(page).to have_content 'Nome: Homem Aranha'  
    end

    it "Quando passo o mouse sobre o Blade", :hover_random do
        listaImg = find('#content').all('img')
        selected_img = listaImg.sample

        selected_img.hover

        expect(page).to have_content "Nome: #{selected_img[:alt]}"
    end
end