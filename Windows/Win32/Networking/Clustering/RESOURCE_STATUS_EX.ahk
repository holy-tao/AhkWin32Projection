#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESOURCE_STATUS_EX {
    #StructPack 8

    ResourceState : CLUSTER_RESOURCE_STATE

    CheckPoint : UInt32

    EventHandle : HANDLE

    ApplicationSpecificErrorCode : UInt32

    Flags : UInt32

    WaitHint : UInt32

}
