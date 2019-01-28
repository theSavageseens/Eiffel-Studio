note
	description: "[
		Summary description for {STUDENT_TESTS}.
		To Do: Students must write thier own tests in this class
		]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT_TESTS
inherit
	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			add_boolean_case (agent t1)
			add_boolean_case (agent t2)
			add_boolean_case (agent t3)
			add_boolean_case (agent t4)
--			add_boolean_case (agent t5)
--			add_boolean_case (agent t6)
--			add_boolean_case (agent t7)
--			add_boolean_case (agent t8)
		end

	tree: SORTED_RBT[INTEGER,STRING]
			-- instantiation of tree
		attribute
			create Result.make_empty
		end

	s_tree: SORTED_BST[STRING, INTEGER]
			-- instantiation of s_tree
		attribute
			create Result.make_empty
		end


feature
	t1: BOOLEAN
		do
			comment("t1: test inorder function in BASIC_NODE apply in BST tree")
			create tree.make_empty
			tree.extend (1, "one")
			tree.extend (2, "two")
			tree.extend (3, "three")
			tree.extend (9, "nine")
			tree.extend (8, "eight")
			tree.extend (7, "seven")

			check attached tree.root as root then
				Result := root.inorder ~ "(1,one)(2,two)(3,three)(7,seven)(8,eight)(9,nine)"
			end
			check Result end


			tree.remove (3)
			check attached tree.root as root then
				Result := root.inorder ~ "(1,one)(2,two)(7,seven)(8,eight)(9,nine)"
			end
			check Result end
		end

	t2: BOOLEAN
		do
			comment("t2: test traverse_inorder function in BASIC_NODE apply in BST tree")
			create tree.make_empty
			tree.extend (1, "one")

			check attached tree.root as root then
				root.traverse_inorder
				Result := root.key ~ 1 and root.value ~ "one"
			end
			check Result end
		end

	t3: BOOLEAN
		local
			largest_node : NODE[INTEGER, STRING]
		do
			comment("t3: test the find_largest function in SORTED_TREE_ADT apply in BST tree")
			create tree.make_empty
			tree.extend (1, "one")
			tree.extend (2, "two")
			tree.extend (3, "three")
			tree.extend (9, "nine")
			tree.extend (8, "eight")
			tree.extend (7, "seven")
			tree.extend (99, "ninety-nine")
			tree.extend (88, "eighty-eight")
			tree.extend (77, "seventy-seven")

			largest_node := tree.node_of (99)
			check attached tree.root as root then
				Result := tree.find_largest (root) ~ largest_node
			end

		end

	t4: BOOLEAN
		local
			smallest_node : NODE[INTEGER, STRING]
		do
			comment("t4: test the find_smallest function in SORTED_TREE_ADT apply in BST tree")
			create tree.make_empty
			tree.extend (1, "one")
			tree.extend (2, "two")
			tree.extend (3, "three")
			tree.extend (9, "nine")
			tree.extend (8, "eight")
			tree.extend (7, "seven")
			tree.extend (99, "ninety-nine")
			tree.extend (88, "eighty-eight")
			tree.extend (77, "seventy-seven")

			smallest_node := tree.node_of (1)
			check attached tree.root as root then
				Result := tree.find_smallest (root) ~ smallest_node
			end

		end

--	t5: BOOLEAN
--		do
--			comment("t1: test inorder function in BASIC_NODE apply in BST tree")
--			create tree.make_empty

--		end

end
