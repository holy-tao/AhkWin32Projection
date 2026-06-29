#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSTOPOLOGY_CONNECTION.ahk" { KSTOPOLOGY_CONNECTION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTOPOLOGY {
    #StructPack 8

    CategoriesCount : UInt32

    Categories : Guid.Ptr

    TopologyNodesCount : UInt32

    TopologyNodes : Guid.Ptr

    TopologyConnectionsCount : UInt32

    TopologyConnections : KSTOPOLOGY_CONNECTION.Ptr

    TopologyNodesNames : Guid.Ptr

    Reserved : UInt32

}
