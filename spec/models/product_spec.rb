require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#validates' do
    let(:product) { Product.new(attributes) }

    subject do
      product.valid?
    end

    context 'with valid attributes' do
      let(:attributes) do
        {
          "lm": "1002",
          "name": "First Product",
          "free_shipping": 1,
          "description": "The better Product",
          "price": 200
        }
      end

      it 'returns error validation' do
        expect(subject).to be_truthy
      end
    end

    context 'without lm' do
      let(:attributes) do
        {
          "name": "First Product",
          "free_shipping": 1,
          "description": "The better Product",
          "price": 200
        }
      end

      it { expect(subject).to be_falsey }

      it 'returns an error message' do
        subject
        expect(product.errors.messages).to match({:lm=>["can't be blank"]})
      end
    end

    context 'without name' do
      let(:attributes) do
        {
          "lm": "1002",
          "free_shipping": 1,
          "description": "The better Product",
          "price": 200
        }
      end

      it { expect(subject).to be_falsey }

      it 'returns an error message' do
        subject
        expect(product.errors.messages).to match({:name=>["can't be blank"]})
      end
    end

    context 'without free_shipping' do
      let(:attributes) do
        {
          "lm": "1002",
          "name": "First Product",
          "description": "The better Product",
          "price": 200
        }
      end

      it { expect(subject).to be_falsey }

      it 'returns an error message' do
        subject
        expect(product.errors.messages).to match({:free_shipping=>["can't be blank"]})
      end
    end

    context 'without price' do
      let(:attributes) do
        {
          "lm": "1002",
          "name": "First Product",
          "free_shipping": 1,
          "description": "The better Product",
        }
      end

      it { expect(subject).to be_falsey }

      it 'returns an error message' do
        subject
        expect(product.errors.messages).to match({:price=>["can't be blank"]})
      end
    end

    context 'with blank attributes' do
      let(:attributes) do
        { }
      end

      it { expect(subject).to be_falsey }

      it 'returns an error message' do
        subject
        expect(product.errors.messages).to match({:free_shipping=>["can't be blank"], :lm=>["can't be blank"], :name=>["can't be blank"], :price=>["can't be blank"]})
      end
    end
  end
end
