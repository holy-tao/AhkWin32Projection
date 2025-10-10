#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A generic container for a connection within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph).
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_graph_edge_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_GRAPH_EDGE_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[DML_GRAPH_EDGE_TYPE](/windows/win32/api/directml/ne-directml-dml_graph_edge_type)**
     * 
     * The type of graph edge. See [DML_GRAPH_EDGE_TYPE](/windows/win32/api/directml/ne-directml-dml_graph_edge_type) for available types, and [DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc) for where to use each type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: \_Field\_size\_(\_Inexpressible\_("Dependent on edge type")) **const void\***
     * 
     * A pointer to the graph edge description. The type of the pointed-to struct must match the value specified in *Type*.
     * @type {Pointer<Void>}
     */
    Desc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
