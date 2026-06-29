#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\STGMEDIUM.ahk" { STGMEDIUM }
#Import "..\..\Graphics\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import ".\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IUnknown.ahk" { IUnknown }
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
