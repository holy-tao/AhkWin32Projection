#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_XPF_NMI_DESCRIPTOR {
    #StructPack 2

    Type : UInt16

    Enabled : BOOLEAN

}
