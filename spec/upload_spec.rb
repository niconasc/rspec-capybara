describe "Upload de arquivo", :upload do
    before(:each) do
        visit "/upload"
        
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/download.jpg'
    end

    it "upload de arquivo txt", :arquivo do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'  
    end

    it "upload de imagem png", :imagem do
        attach_file('file-upload', @imagem)
            click_button 'Upload'

            img = find('#new-image')
            expect(img[:src]).to include 'download.jpg'
    end
end
