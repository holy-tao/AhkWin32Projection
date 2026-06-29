#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteTextFormat1.ahk" { IDWriteTextFormat1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_LINE_SPACING.ahk" { DWRITE_LINE_SPACING }

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information. | IDWriteTextFormat2 interface
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextformat2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextFormat2 extends IDWriteTextFormat1 {
    /**
     * The interface identifier for IDWriteTextFormat2
     * @type {Guid}
     */
    static IID := Guid("{f67e0edd-9e3d-4ecc-8c32-4183253dfe70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextFormat2 interfaces
    */
    struct Vtbl extends IDWriteTextFormat1.Vtbl {
        SetLineSpacing : IntPtr
        GetLineSpacing : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextFormat2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set line spacing. | IDWriteTextFormat2 SetLineSpacing method
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions Type: **const [**DWRITE\_LINE\_SPACING**](/windows/win32/api/Dwrite_3/ns-dwrite_3-dwrite_line_spacing)\***
     * 
     * How to manage space between lines.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextformat2-setlinespacing
     */
    SetLineSpacing(lineSpacingOptions) {
        result := ComCall(36, this, DWRITE_LINE_SPACING.Ptr, lineSpacingOptions, "HRESULT")
        return result
    }

    /**
     * Gets the line spacing adjustment set for a multiline text paragraph. (IDWriteTextFormat2.GetLineSpacing)
     * @returns {DWRITE_LINE_SPACING} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_line_spacing">DWRITE_LINE_SPACING</a>*</b>
     * 
     * A structure describing how the space between lines is managed for the paragraph.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat2-getlinespacing
     */
    GetLineSpacing() {
        lineSpacingOptions := DWRITE_LINE_SPACING()
        result := ComCall(37, this, DWRITE_LINE_SPACING.Ptr, lineSpacingOptions, "HRESULT")
        return lineSpacingOptions
    }

    Query(iid) {
        if (IDWriteTextFormat2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLineSpacing := CallbackCreate(GetMethod(implObj, "SetLineSpacing"), flags, 2)
        this.vtbl.GetLineSpacing := CallbackCreate(GetMethod(implObj, "GetLineSpacing"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLineSpacing)
        CallbackFree(this.vtbl.GetLineSpacing)
    }
}
