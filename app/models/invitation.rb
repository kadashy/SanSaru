class Invitation < ApplicationRecord
  has_paper_trail
  belongs_to :invited_one, class_name: 'User', optional: true
  belongs_to :invited_two, class_name: 'User', optional: true
  belongs_to :user, class_name: 'User'

  def self.build_invitation_trees
    trees = []
    roots = Invitation.where(monkey: true)
    roots.each do |root|
      node = build_node root
      trees.push(node)
    end
    trees
  end

  private

  def self.build_node(invitation, parent = nil)
    name = "#{invitation.user.name}"
    node = { name: name, parent: parent, payed: invitation.payed }
    if invitation.invited_one
      son = build_node(Invitation.find_by(user_id: invitation.invited_one.id), name)
      node[:children].nil? ? node[:children] = [son] : node[:children].push(son)
    end

    if invitation.invited_two
      son = build_node(Invitation.find_by(user_id: invitation.invited_two.id), name)
      node[:children].nil? ? node[:children] = [son] : node[:children].push(son)
    end

    node
  end
end
