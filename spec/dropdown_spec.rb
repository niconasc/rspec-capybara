describe "Caixa de opções", :'dropdown' do

    it "item específico simples" do
        visit "/dropdown"
        
        select('Loki', from: 'dropdown')
        
    end
    
    it "item específico com o find()" do
        visit "/dropdown"
        
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        
    end

    # A opção Sample do Ruby seleciona uma opção randomica
    it "qualquer item", :sample do
        visit "/dropdown"
        
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        
    end
end
