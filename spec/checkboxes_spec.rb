describe "Caixa de seleção", :checkbox do

    # A funcão check ou uncheck funciona apenas para "id" e "name"

    before(:each) do
        visit "/checkboxes"
    end

    it "marcando uma opção", :one_option do
        check('thor')
    end

    it "desmarcando uma opção", :one_option do
        uncheck('antman')
    end
    
    it "marcando uma opção com find set true", :option_setTrue do
        find('input[value=cap]').set(true)
    end

    it "desmarcando uma opção com find set true", :option_setFalse do
        find('input[value=guardians]').set(false)
    end
end
