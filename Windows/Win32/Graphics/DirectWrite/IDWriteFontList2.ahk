#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontSet1.ahk" { IDWriteFontSet1 }
#Import ".\IDWriteFontList1.ahk" { IDWriteFontList1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a list of fonts. **IDWriteFontList2** adds new facilities, including retrieving the underlying font set used by the list.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontlist2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontList2 extends IDWriteFontList1 {
    /**
     * The interface identifier for IDWriteFontList2
     * @type {Guid}
     */
    static IID := Guid("{c0763a34-77af-445a-b735-08c37b0a5bf5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontList2 interfaces
    */
    struct Vtbl extends IDWriteFontList1.Vtbl {
        GetFontSet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the underlying font set used by this list.
     * @returns {IDWriteFontSet1} Type: **[IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontSet1](./nn-dwrite_3-idwritefontset1.md) interface. On successful completion, the function sets the pointer to the font set used by the list.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontlist2-getfontset
     */
    GetFontSet() {
        result := ComCall(9, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet1(fontSet)
    }

    Query(iid) {
        if (IDWriteFontList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontSet := CallbackCreate(GetMethod(implObj, "GetFontSet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontSet)
    }
}
