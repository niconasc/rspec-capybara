describe "Teclado", :key do

    # A funcão check ou uncheck funciona apenas para "id" e "name"

    before(:each) do
        visit "/key_presses"
    end

    it "Enviando tecla Space" do
        find('#campo-id').send_keys :space
        expect(page).to have_content 'You entered: SPACE'  
    end

    it "Enviando tecla TAB" do
        find('#campo-id').send_keys :tab
        expect(page).to have_content 'You entered: TAB'  
    end

    it "Enviando teclas Simbolos", :simble do
        teclas = %i[tab escape space enter shift control alt]

        teclas.each do |t|
            find('#campo-id').send_keys t
            expect(page).to have_content "You entered: #{t.to_s.upcase}"  
        end
    end

    it "Enviando teclas de letras", :letter do
        letras = %w[a s d f g h j k l]

        letras.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content "You entered: #{l.to_s.upcase}"  
        end
    end
end