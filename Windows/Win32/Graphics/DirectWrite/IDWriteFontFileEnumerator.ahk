#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Encapsulates a collection of font files. The font system uses this interface to enumerate font files when building a font collection.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileenumerator
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFileEnumerator extends IUnknown {
    /**
     * The interface identifier for IDWriteFontFileEnumerator
     * @type {Guid}
     */
    static IID := Guid("{72755049-5ff7-435d-8348-4be97cfa6c7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFileEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveNext           : IntPtr
        GetCurrentFontFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFileEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Advances to the next font file in the collection. When it is first created, the enumerator is positioned before the first element of the collection and the first call to MoveNext advances to the first file.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When the method returns, contains  the value <b>TRUE</b> if the enumerator advances to a file; otherwise, <b>FALSE</b> if
     *      the enumerator advances past the last file in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, BOOL.Ptr, &hasCurrentFile := 0, "HRESULT")
        return hasCurrentFile
    }

    /**
     * Gets a reference to the current font file.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * When this method returns, the address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>  object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileenumerator-getcurrentfontfile
     */
    GetCurrentFontFile() {
        result := ComCall(4, this, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    Query(iid) {
        if (IDWriteFontFileEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
        this.vtbl.GetCurrentFontFile := CallbackCreate(GetMethod(implObj, "GetCurrentFontFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveNext)
        CallbackFree(this.vtbl.GetCurrentFontFile)
    }
}
