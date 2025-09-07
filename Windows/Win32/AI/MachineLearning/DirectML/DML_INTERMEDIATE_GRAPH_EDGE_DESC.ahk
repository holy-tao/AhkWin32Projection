#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a connection within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/desktop/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph). This structure is used to define a connection between internal nodes.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_intermediate_graph_edge_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_INTERMEDIATE_GRAPH_EDGE_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the graph node from which a connection to another node is specified.
     * @type {Integer}
     */
    FromNodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the output on the node at index *FromNodeIndex* where the connection is specified.
     * @type {Integer}
     */
    FromNodeOutputIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the graph node into which a connection from another node is specified.
     * @type {Integer}
     */
    ToNodeIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the input on the node at index *ToNodeIndex* where the connection is specified.
     * @type {Integer}
     */
    ToNodeInputIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: \_Field\_z\_ \_Maybenull\_ **const char\***
     * 
     * An optional name for the graph connection. If provided, this might be used within certain error messages emitted by the DirectML debug layer.
     * @type {Pointer<Ptr>}
     */
    Name {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
