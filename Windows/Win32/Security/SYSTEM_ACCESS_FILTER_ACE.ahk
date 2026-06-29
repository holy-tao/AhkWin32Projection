#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_ACCESS_FILTER_ACE {
    #StructPack 4

    Header : ACE_HEADER

    Mask : UInt32

    SidStart : UInt32

}
