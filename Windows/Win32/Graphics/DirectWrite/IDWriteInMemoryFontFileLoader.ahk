#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFileLoader.ahk" { IDWriteFontFileLoader }
#Import ".\IDWriteFactory.ahk" { IDWriteFactory }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a font file loader that can access in-memory fonts.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteinmemoryfontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteInMemoryFontFileLoader extends IDWriteFontFileLoader {
    /**
     * The interface identifier for IDWriteInMemoryFontFileLoader
     * @type {Guid}
     */
    static IID := Guid("{dc102f47-a12d-4b1c-822d-9e117e33043f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteInMemoryFontFileLoader interfaces
    */
    struct Vtbl extends IDWriteFontFileLoader.Vtbl {
        CreateInMemoryFontFileReference : IntPtr
        GetFileCount                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteInMemoryFontFileLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font file reference (IDWriteFontFile object) from an array of bytes.
     * @param {IDWriteFactory} factory Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefactory">IDWriteFactory</a>*</b>
     * 
     * Factory object used to create the font file reference.
     * @param {Integer} fontData Type: <b>void const*</b>
     * 
     * Pointer to a memory block containing the font data.
     * @param {Integer} fontDataSize Type: <b>UINT32</b>
     * 
     * Size of the font data.
     * @param {IUnknown} ownerObject Type: <b><a href="https://docs.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Optional object that owns the memory specified by the fontData parameter. If this parameter is not NULL, the method stores a
     *           pointer to the font data and adds a reference to the owner object. The fontData pointer must remain valid until the owner object is released. If
     *           this parameter is NULL, the method makes a copy of the font data.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * Receives a pointer to the newly-created font file reference.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteinmemoryfontfileloader-createinmemoryfontfilereference
     */
    CreateInMemoryFontFileReference(factory, fontData, fontDataSize, ownerObject) {
        result := ComCall(4, this, "ptr", factory, "ptr", fontData, "uint", fontDataSize, "ptr", ownerObject, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * Returns the number of font file references that have been created using this loader instance.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of font file references that have been created using this loader instance.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteinmemoryfontfileloader-getfilecount
     */
    GetFileCount() {
        result := ComCall(5, this, UInt32)
        return result
    }

    Query(iid) {
        if (IDWriteInMemoryFontFileLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInMemoryFontFileReference := CallbackCreate(GetMethod(implObj, "CreateInMemoryFontFileReference"), flags, 6)
        this.vtbl.GetFileCount := CallbackCreate(GetMethod(implObj, "GetFileCount"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInMemoryFontFileReference)
        CallbackFree(this.vtbl.GetFileCount)
    }
}
