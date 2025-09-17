#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Decribes a node within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/desktop/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_operator_graph_node_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_OPERATOR_GRAPH_NODE_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>[IDMLOperator](/windows/win32/api/directml/nn-directml-idmloperator)*</b>
     * 
     * A DirectML operator defining the behavior of the node.
     * @type {Pointer<IDMLOperator>}
     */
    Operator {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: \_Field\_z\_ \_Maybenull\_ **const char\***
     * 
     * An optional name for the graph connection. If provided, this might be used within certain error messages emitted by the DirectML debug layer.
     * @type {Pointer<Byte>}
     */
    Name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
