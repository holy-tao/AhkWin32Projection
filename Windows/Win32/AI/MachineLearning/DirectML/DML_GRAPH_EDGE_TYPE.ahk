#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a type of graph edge. See [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc) for the usage of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_graph_edge_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_GRAPH_EDGE_TYPE extends Win32Enum {

    /**
     * Specifies an unknown graph edge type, and is never valid. Using this value results in an error.
     * Native name: DML_GRAPH_EDGE_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Specifies that the graph edge is described by the [DML_INPUT_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_input_graph_edge_desc) structure.
     * Native name: DML_GRAPH_EDGE_TYPE_INPUT
     * @type {Integer (Int32)}
     */
    static INPUT => 1

    /**
     * Specifies that the graph edge is described by the [DML_OUTPUT_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_output_graph_edge_desc) structure.
     * Native name: DML_GRAPH_EDGE_TYPE_OUTPUT
     * @type {Integer (Int32)}
     */
    static OUTPUT => 2

    /**
     * Specifies that the graph edge is described by the [DML_INTERMEDIATE_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_intermediate_graph_edge_desc) structure.
     * Native name: DML_GRAPH_EDGE_TYPE_INTERMEDIATE
     * @type {Integer (Int32)}
     */
    static INTERMEDIATE => 3
}
