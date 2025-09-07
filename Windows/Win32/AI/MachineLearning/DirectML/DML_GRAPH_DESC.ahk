#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a graph of DirectML operators used to compile a combined, optimized operator.
 * @remarks
 * The graph described by this structure must be a directed acyclic graph. You must define a connection for the input and output of each supplied node, except for inputs and outputs that are optional for the associated operator.
  * 
  * Nodes may use operators that were created using the [DML_TENSOR_FLAG_OWNED_BY_DML](/windows/win32/api/directml/ne-directml-dml_tensor_flags) flag for certain inputs. Any operator inputs using this flag must be connected to graph inputs. All operator inputs connected to the same graph input must use or omit this flag equivalently.
  * 
  * It is legal to connect operators whose connected inputs and outputs use different dimension counts, sizes, and data types. This implies that the tensor data blob is interpreted differently by each operator. The *TotalTensorSizeInBytes* field of connected tensor inputs and outputs must be identical, though. Operators should only read regions of tensors written by earlier operators. Any padding regions in the output of an operation (resulting from the use of strides) are not guaranteed to be read as zero by down-stream operators.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_graph_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_GRAPH_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of inputs of the overall graph. Each graph input may be connected to a variable number of internal nodes, therefore this may be different from *InputEdgeCount*.
     * @type {Integer}
     */
    InputCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of outputs of the overall graph. Each graph output may be connected to a variable number of internal nodes, therefore this may be different from *OutputEdgeCount*.
     * @type {Integer}
     */
    OutputCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of internal nodes in the graph.
     * @type {Integer}
     */
    NodeCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: \_Field\_size\_(NodeCount) **const [DML_GRAPH_NODE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_node_desc)\***
     * 
     * The internal nodes in the graph.
     * @type {Pointer<DML_GRAPH_NODE_DESC>}
     */
    Nodes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of connections between graph inputs and inputs of internal nodes in the graph.
     * @type {Integer}
     */
    InputEdgeCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(InputEdgeCount) **const [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc)\***
     * 
     * An array of connections between graph inputs and inputs of internal nodes in the graph. The *Type* field within each element should be set to [DML_GRAPH_EDGE_TYPE_INPUT](/windows/win32/api/directml/ne-directml-dml_graph_edge_type).
     * @type {Pointer<DML_GRAPH_EDGE_DESC>}
     */
    InputEdges {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of connections between graph outputs and outputs of internal nodes in the graph.
     * @type {Integer}
     */
    OutputEdgeCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: \_Field\_size\_(OutputEdgeCount) **const [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc)\***
     * 
     * An array of connections between graph outputs and outputs of internal nodes in the graph. The *Type* field within each element should be set to [DML_GRAPH_EDGE_TYPE_OUTPUT](/windows/win32/api/directml/ne-directml-dml_graph_edge_type).
     * @type {Pointer<DML_GRAPH_EDGE_DESC>}
     */
    OutputEdges {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of internal connections between nodes in the graph.
     * @type {Integer}
     */
    IntermediateEdgeCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: \_Field\_size\_(IntermediateEdgeCount) **const [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc)\***
     * 
     * An array of connections between inputs and outputs of internal nodes in the graph. The Type field within each element should be set to [DML_GRAPH_EDGE_TYPE_INTERMEDIATE](/windows/win32/api/directml/ne-directml-dml_graph_edge_type)
     * @type {Pointer<DML_GRAPH_EDGE_DESC>}
     */
    IntermediateEdges {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
