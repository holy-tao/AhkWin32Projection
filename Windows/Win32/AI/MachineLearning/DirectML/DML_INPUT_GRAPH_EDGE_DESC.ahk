#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a connection within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/desktop/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph). This structure is used to define a connection from a graph input to an input of an internal node.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_input_graph_edge_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_INPUT_GRAPH_EDGE_DESC {
    #StructPack 8

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the graph input from which a connection to an internal node input is specified.
     */
    GraphInputIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the internal node onto which the connection from the graph input is specified.
     */
    ToNodeIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the input on the internal node where the connection is specified.
     */
    ToNodeInputIndex : UInt32

    /**
     * Type: \_Field\_z\_ \_Maybenull\_ **const char\***
     * 
     * An optional name for the graph connection. If provided, this might be used within certain error messages emitted by the DirectML debug layer.
     */
    Name : PSTR

}
