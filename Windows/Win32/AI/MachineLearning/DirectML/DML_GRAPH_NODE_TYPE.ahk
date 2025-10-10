#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a type of graph node. See [DML_GRAPH_NODE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_node_desc) for the usage of this enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_graph_node_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_GRAPH_NODE_TYPE{

    /**
     * Specifies an unknown graph edge type, and is never valid. Using this value results in an error.
     * @type {Integer (Int32)}
     */
    static DML_GRAPH_NODE_TYPE_INVALID => 0

    /**
     * Specifies that the graph edge is described by the [DML_OPERATOR_GRAPH_NODE_DESC](/windows/win32/api/directml/ns-directml-dml_operator_graph_node_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_GRAPH_NODE_TYPE_OPERATOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static DML_GRAPH_NODE_TYPE_CONSTANT => 2
}
