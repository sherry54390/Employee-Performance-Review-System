class RemoveAnswersFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :answers, :string
  end
end
