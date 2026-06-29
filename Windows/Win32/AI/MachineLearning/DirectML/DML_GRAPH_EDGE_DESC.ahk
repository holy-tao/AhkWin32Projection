#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_GRAPH_EDGE_TYPE.ahk" { DML_GRAPH_EDGE_TYPE }

/**
 * A generic container for a connection within a graph of DirectML operators defined by [DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc) and passed to [IDMLDevice1::CompileGraph](/windows/desktop/api/directml/nf-directml-idmldevice1-compilegraph).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_graph_edge_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_GRAPH_EDGE_DESC {
    #StructPack 8

    /**
     * Type: **[DML_GRAPH_EDGE_TYPE](/windows/win32/api/directml/ne-directml-dml_graph_edge_type)**
     * 
     * The type of graph edge. See [DML_GRAPH_EDGE_TYPE](/windows/win32/api/directml/ne-directml-dml_graph_edge_type) for available types, and [DML_GRAPH_DESC](/windows/win32/api/directml/ns-directml-dml_graph_desc) for where to use each type.
     */
    Type : DML_GRAPH_EDGE_TYPE

    /**
     * Type: \_Field\_size\_(\_Inexpressible\_("Dependent on edge type")) **const void\***
     * 
     * A pointer to the graph edge description. The type of the pointed-to struct must match the value specified in *Type*.
     */
    Desc : IntPtr

}
