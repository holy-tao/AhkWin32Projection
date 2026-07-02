#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\REMSECURITY_ATTRIBUTES.ahk" { REMSECURITY_ATTRIBUTES }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct RemBINDINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    szExtraInfo : PWSTR

    grfBindInfoF : UInt32

    dwBindVerb : UInt32

    szCustomVerb : PWSTR

    cbstgmedData : UInt32

    dwOptions : UInt32

    dwOptionsFlags : UInt32

    dwCodePage : UInt32

    securityAttributes : REMSECURITY_ATTRIBUTES

    iid : Guid

    pUnk : IUnknown

    dwReserved : UInt32

}
