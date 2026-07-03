#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct CONFIRMSAFETY {
    #StructPack 8

    clsid : Guid

    pUnk : IUnknown

    dwFlags : UInt32

}
