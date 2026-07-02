#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import "StructuredStorage\IStorage.ahk" { IStorage }
#Import ".\IStream.ahk" { IStream }
#Import "..\..\Graphics\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import ".\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct STGMEDIUM {
    #StructPack 8


    struct _u {
        hBitmap : HBITMAP

        static __New() {
            DefineProp(this.Prototype, 'hMetaFilePict', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'hEnhMetaFile', { type: HENHMETAFILE, offset: 0 })
            DefineProp(this.Prototype, 'hGlobal', { type: HGLOBAL, offset: 0 })
            DefineProp(this.Prototype, 'lpszFileName', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'pstm', { type: IStream, offset: 0 })
            DefineProp(this.Prototype, 'pstg', { type: IStorage, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    tymed : UInt32

    u : STGMEDIUM._u

    pUnkForRelease : IUnknown

}
