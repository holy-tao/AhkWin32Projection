#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBFAILUREINFO {
    #StructPack 8

    hRow : IntPtr

    iColumn : IntPtr

    failure : HRESULT

}
