#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a type of graph edge. See [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc) for the usage of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_graph_edge_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_GRAPH_EDGE_TYPE {
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
    static DML_GRAPH_EDGE_TYPE_INVALID => 0

    /**
     * Specifies that the graph edge is described by the [DML_INPUT_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_input_graph_edge_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_GRAPH_EDGE_TYPE_INPUT => 1

    /**
     * Specifies that the graph edge is described by the [DML_OUTPUT_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_output_graph_edge_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_GRAPH_EDGE_TYPE_OUTPUT => 2

    /**
     * Specifies that the graph edge is described by the [DML_INTERMEDIATE_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_intermediate_graph_edge_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_GRAPH_EDGE_TYPE_INTERMEDIATE => 3
}
