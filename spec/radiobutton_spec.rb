describe "Seleção de radio button", :radio do
    before(:each) do
        visit "/radios"
    end

    it "seleção por id", :radio_id do
        choose('cap')
    end

    it "seleção por find e css selector", :radio_css do
        find('input[value=guardians]').click
    end

    it "seleção aleatória por find", :radio_random do
        radio = find('#radios')
        radio.all('input').sample.click
    end
end
