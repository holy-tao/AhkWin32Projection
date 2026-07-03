#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDMLOperator.ahk" { IDMLOperator }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Decribes a node within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/desktop/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_operator_graph_node_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_OPERATOR_GRAPH_NODE_DESC {
    #StructPack 8

    /**
     * Type: <b>[IDMLOperator](/windows/win32/api/directml/nn-directml-idmloperator)*</b>
     * 
     * A DirectML operator defining the behavior of the node.
     */
    Operator : IDMLOperator

    /**
     * Type: \_Field\_z\_ \_Maybenull\_ **const char\***
     * 
     * An optional name for the graph connection. If provided, this might be used within certain error messages emitted by the DirectML debug layer.
     */
    Name : PSTR

}
