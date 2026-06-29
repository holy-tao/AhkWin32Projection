#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a type of graph node. See [DML_GRAPH_NODE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_node_desc) for the usage of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_graph_node_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_GRAPH_NODE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
}
