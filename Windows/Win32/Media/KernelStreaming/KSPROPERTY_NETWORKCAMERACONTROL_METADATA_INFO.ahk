#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO {
    #StructPack 4

    MetadataItems : UInt32

    Size : UInt32

    PTZStatus : BOOL

    Events : BOOL

    Analytics : BOOL

    Reserved : BOOL

}
