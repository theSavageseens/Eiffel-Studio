note
	description: "[
		{SORTED_BST} is a concrete implementation of sorted tree. It
		inherits all of {SORTED_TREE}'s features and contracts and
		implements its deferred features.
		
		You must implement to specifications/tests
		wherever you see
			-- TO DO --
			check False end
	]"
	author: "JP, JSO, Tao Deng"
	date: "$Date$"
	revision: "$Revision$"

class
	SORTED_BST[K -> COMPARABLE, V -> ANY]

inherit
	SORTED_TREE_ADT[K,V]

create
	make_empty

feature{NONE} -- private commands

	extend_node(a_item: TUPLE[key:K; val:V]; a_node: NODE[K,V])
			-- helper method to extend `node' with `a_item'
			-- Functions similar as the "extend_node" function in class SORTED_RBT
		do
			if a_node.key > a_item.key then
				if attached a_node.left as left then
					extend_node(a_item, left)
				else
					a_node.left := create {NODE[K,V]}.make(a_item)
				end
			elseif a_node.key < a_item.key then
				if attached a_node.right as right then
					extend_node(a_item, right)
				else
					a_node.right := create {NODE[K,V]}.make(a_item)
				end
			end
		end

	remove_node(a_node: NODE[K,V])
			-- helper method to remove `node'
			-- Functions similar as the "remove_node" function in class SORTED_RBT
		local
			smallest: NODE[K,V]
			s_item: TUPLE[K,V]

		do
			if attached a_node.right as right and then attached a_node.left as left then
					-- a_node has two children
				smallest := find_smallest(right)
				s_item := smallest.item
				remove_node(smallest)
				a_node.item := s_item

			elseif attached a_node.only_child as child then
				a_node.replace_node (child)
			elseif attached a_node.parent as parent then
					-- a_node has no children but is not root
				a_node.make_void
			else
					-- a_node is root
				wipe_out
			end
		end

end

