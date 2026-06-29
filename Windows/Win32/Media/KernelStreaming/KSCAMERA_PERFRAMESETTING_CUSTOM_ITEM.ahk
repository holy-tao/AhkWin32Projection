#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PERFRAMESETTING_CUSTOM_ITEM {
    #StructPack 4

    Size : UInt32

    Reserved : UInt32

    Id : Guid

}
