#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME {
    #StructPack 2

    NewVolumeName : WCHAR[260]

}
