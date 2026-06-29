#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontSetBuilder.ahk" { IDWriteFontSetBuilder }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains methods for building a font set. (IDWriteFontSetBuilder1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSetBuilder1 extends IDWriteFontSetBuilder {
    /**
     * The interface identifier for IDWriteFontSetBuilder1
     * @type {Guid}
     */
    static IID := Guid("{3ff7715f-3cdc-4dc6-9b72-ec5621dccafd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSetBuilder1 interfaces
    */
    struct Vtbl extends IDWriteFontSetBuilder.Vtbl {
        AddFontFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSetBuilder1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds references to all the fonts in the specified font file.
     * @param {IDWriteFontFile} fontFile Type: <b>IDWriteFontFile*</b>
     * 
     * Font file reference object to add to the set. If the file is not a supported OpenType font file, then a DWRITE_E_FILEFORMAT error will be returned.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder1-addfontfile
     */
    AddFontFile(fontFile) {
        result := ComCall(7, this, "ptr", fontFile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteFontSetBuilder1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddFontFile := CallbackCreate(GetMethod(implObj, "AddFontFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddFontFile)
    }
}
