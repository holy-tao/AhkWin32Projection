#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_PROFILE {
    #StructPack 4

    ProfileId : Guid

    Index : UInt32

    Reserved : UInt32

}
