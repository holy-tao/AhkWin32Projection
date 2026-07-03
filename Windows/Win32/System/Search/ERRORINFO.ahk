#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct ERRORINFO {
    #StructPack 4

    hrError : HRESULT

    dwMinor : UInt32

    clsid : Guid

    iid : Guid

    dispid : Int32

}
