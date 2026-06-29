#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\STGMEDIUM.ahk" { STGMEDIUM }
#Import "..\..\Graphics\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import ".\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import ".\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "StructuredStorage\IStorage.ahk" { IStorage }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct BINDINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    szExtraInfo : PWSTR

    stgmedData : STGMEDIUM

    grfBindInfoF : UInt32

    dwBindVerb : UInt32

    szCustomVerb : PWSTR

    cbstgmedData : UInt32

    dwOptions : UInt32

    dwOptionsFlags : UInt32

    dwCodePage : UInt32

    securityAttributes : SECURITY_ATTRIBUTES

    iid : Guid

    pUnk : IUnknown

    dwReserved : UInt32

}
