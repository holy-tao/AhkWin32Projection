#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_GRAPH_NODE_DESC.ahk" { DML_GRAPH_NODE_DESC }
#Import ".\DML_GRAPH_EDGE_DESC.ahk" { DML_GRAPH_EDGE_DESC }

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
 */
export default struct DML_GRAPH_DESC {
    #StructPack 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of inputs of the overall graph. Each graph input may be connected to a variable number of internal nodes, therefore this may be different from *InputEdgeCount*.
     */
    InputCount : UInt32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of outputs of the overall graph. Each graph output may be connected to a variable number of internal nodes, therefore this may be different from *OutputEdgeCount*.
     */
    OutputCount : UInt32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of internal nodes in the graph.
     */
    NodeCount : UInt32

    /**
     * Type: \_Field\_size\_(NodeCount) **const [DML_GRAPH_NODE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_node_desc)\***
     * 
     * The internal nodes in the graph.
     */
    Nodes : DML_GRAPH_NODE_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of connections between graph inputs and inputs of internal nodes in the graph.
     */
    InputEdgeCount : UInt32

    /**
     * Type: \_Field\_size\_(InputEdgeCount) **const [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc)\***
     * 
     * An array of connections between graph inputs and inputs of internal nodes in the graph. The *Type* field within each element should be set to [DML_GRAPH_EDGE_TYPE_INPUT](/windows/win32/api/directml/ne-directml-dml_graph_edge_type).
     */
    InputEdges : DML_GRAPH_EDGE_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of connections between graph outputs and outputs of internal nodes in the graph.
     */
    OutputEdgeCount : UInt32

    /**
     * Type: \_Field\_size\_(OutputEdgeCount) **const [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc)\***
     * 
     * An array of connections between graph outputs and outputs of internal nodes in the graph. The *Type* field within each element should be set to [DML_GRAPH_EDGE_TYPE_OUTPUT](/windows/win32/api/directml/ne-directml-dml_graph_edge_type).
     */
    OutputEdges : DML_GRAPH_EDGE_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of internal connections between nodes in the graph.
     */
    IntermediateEdgeCount : UInt32

    /**
     * Type: \_Field\_size\_(IntermediateEdgeCount) **const [DML_GRAPH_EDGE_DESC](/windows/win32/api/directml/ns-directml-dml_graph_edge_desc)\***
     * 
     * An array of connections between inputs and outputs of internal nodes in the graph. The Type field within each element should be set to [DML_GRAPH_EDGE_TYPE_INTERMEDIATE](/windows/win32/api/directml/ne-directml-dml_graph_edge_type)
     */
    IntermediateEdges : DML_GRAPH_EDGE_DESC.Ptr

}
