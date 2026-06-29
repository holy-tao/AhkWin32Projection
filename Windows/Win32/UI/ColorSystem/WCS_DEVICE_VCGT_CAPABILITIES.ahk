#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct WCS_DEVICE_VCGT_CAPABILITIES {
    #StructPack 4

    Size : UInt32

    SupportsVcgt : BOOL

}
