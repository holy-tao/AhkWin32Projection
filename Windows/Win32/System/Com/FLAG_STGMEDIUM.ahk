#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Graphics\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import ".\IStream.ahk" { IStream }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\STGMEDIUM.ahk" { STGMEDIUM }
#Import "StructuredStorage\IStorage.ahk" { IStorage }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct FLAG_STGMEDIUM {
    #StructPack 8

    ContextFlags : Int32

    fPassOwnership : Int32

    Stgmed : STGMEDIUM

}
