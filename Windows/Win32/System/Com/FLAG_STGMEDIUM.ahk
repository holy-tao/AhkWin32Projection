#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import "StructuredStorage\IStorage.ahk" { IStorage }
#Import ".\IStream.ahk" { IStream }
#Import ".\STGMEDIUM.ahk" { STGMEDIUM }
#Import "..\..\Graphics\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import ".\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct FLAG_STGMEDIUM {
    #StructPack 8

    ContextFlags : Int32

    fPassOwnership : Int32

    Stgmed : STGMEDIUM

}
