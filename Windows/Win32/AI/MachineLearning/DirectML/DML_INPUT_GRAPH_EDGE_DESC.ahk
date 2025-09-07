#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Describes a connection within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/desktop/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph). This structure is used to define a connection from a graph input to an input of an internal node.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_input_graph_edge_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_INPUT_GRAPH_EDGE_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the graph input from which a connection to an internal node input is specified.
     * @type {Integer}
     */
    GraphInputIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the internal node onto which the connection from the graph input is specified.
     * @type {Integer}
     */
    ToNodeIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The index of the input on the internal node where the connection is specified.
     * @type {Integer}
     */
    ToNodeInputIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: \_Field\_z\_ \_Maybenull\_ **const char\***
     * 
     * An optional name for the graph connection. If provided, this might be used within certain error messages emitted by the DirectML debug layer.
     * @type {PSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PSTR(this.ptr + 16)
            return this.__Name
        }
    }
}
