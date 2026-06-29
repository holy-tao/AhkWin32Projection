#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a connection within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/desktop/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph). This structure is used to define a connection between internal nodes.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_intermediate_graph_edge_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_INTERMEDIATE_GRAPH_EDGE_DESC {
    #StructPack 8

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the graph node from which a connection to another node is specified.
     */
    FromNodeIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the output on the node at index *FromNodeIndex* where the connection is specified.
     */
    FromNodeOutputIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the graph node into which a connection from another node is specified.
     */
    ToNodeIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the input on the node at index *ToNodeIndex* where the connection is specified.
     */
    ToNodeInputIndex : UInt32

    /**
     * Type: \_Field\_z\_ \_Maybenull\_ **const char\***
     * 
     * An optional name for the graph connection. If provided, this might be used within certain error messages emitted by the DirectML debug layer.
     */
    Name : PSTR

}
