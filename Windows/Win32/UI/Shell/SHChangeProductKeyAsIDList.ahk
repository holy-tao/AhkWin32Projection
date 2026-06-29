#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * SHChangeProductKeyAsIDList structure
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shchangeproductkeyasidlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHChangeProductKeyAsIDList {
    #StructPack 2

    cb : UInt16

    wszProductKey : WCHAR[39]

    cbZero : UInt16

}
