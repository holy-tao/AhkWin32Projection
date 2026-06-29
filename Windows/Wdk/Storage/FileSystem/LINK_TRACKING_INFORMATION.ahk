#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LINK_TRACKING_INFORMATION_TYPE.ahk" { LINK_TRACKING_INFORMATION_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct LINK_TRACKING_INFORMATION {
    #StructPack 4

    Type : LINK_TRACKING_INFORMATION_TYPE

    VolumeId : Int8[16]

}
