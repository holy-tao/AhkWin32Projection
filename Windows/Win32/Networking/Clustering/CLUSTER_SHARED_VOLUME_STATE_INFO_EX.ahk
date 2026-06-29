#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_SHARED_VOLUME_STATE.ahk" { CLUSTER_SHARED_VOLUME_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SHARED_VOLUME_STATE_INFO_EX {
    #StructPack 8

    szVolumeName : WCHAR[260]

    szNodeName : WCHAR[260]

    VolumeState : CLUSTER_SHARED_VOLUME_STATE

    szVolumeFriendlyName : WCHAR[260]

    RedirectedIOReason : Int64

    VolumeRedirectedIOReason : Int64

}
