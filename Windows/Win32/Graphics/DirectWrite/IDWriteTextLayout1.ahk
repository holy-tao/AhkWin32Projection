#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteTextLayout.ahk" { IDWriteTextLayout }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_TEXT_RANGE.ahk" { DWRITE_TEXT_RANGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a block of text after it has been fully analyzed and formatted. (IDWriteTextLayout1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritetextlayout1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextLayout1 extends IDWriteTextLayout {
    /**
     * The interface identifier for IDWriteTextLayout1
     * @type {Guid}
     */
    static IID := Guid("{9064d822-80a7-465c-a986-df65f78b8feb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextLayout1 interfaces
    */
    struct Vtbl extends IDWriteTextLayout.Vtbl {
        SetPairKerning      : IntPtr
        GetPairKerning      : IntPtr
        SetCharacterSpacing : IntPtr
        GetCharacterSpacing : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextLayout1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables or disables pair-kerning on a given text range.
     * @param {BOOL} isPairKerningEnabled Type: <b>BOOL</b>
     * 
     * The flag that indicates whether text is pair-kerned.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * The text range to which the change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextlayout1-setpairkerning
     */
    SetPairKerning(isPairKerningEnabled, textRange) {
        result := ComCall(67, this, BOOL, isPairKerningEnabled, DWRITE_TEXT_RANGE, textRange, "HRESULT")
        return result
    }

    /**
     * Gets whether or not pair-kerning is enabled at given position.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The current text position.
     * @param {Pointer<BOOL>} isPairKerningEnabled Type: <b>BOOL*</b>
     * 
     * The flag that indicates whether text is pair-kerned.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The position range of the current format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextlayout1-getpairkerning
     */
    GetPairKerning(currentPosition, isPairKerningEnabled, textRange) {
        isPairKerningEnabledMarshal := isPairKerningEnabled is VarRef ? "int*" : "ptr"

        result := ComCall(68, this, "uint", currentPosition, isPairKerningEnabledMarshal, isPairKerningEnabled, DWRITE_TEXT_RANGE.Ptr, textRange, "HRESULT")
        return result
    }

    /**
     * Sets the spacing between characters.
     * @param {Float} leadingSpacing Type: <b>FLOAT</b>
     * 
     * The spacing before each character, in reading order.
     * @param {Float} trailingSpacing Type: <b>FLOAT</b>
     * 
     * The spacing after each character, in reading order.
     * @param {Float} minimumAdvanceWidth Type: <b>FLOAT</b>
     * 
     * The minimum advance of each character, to prevent characters from becoming too thin or zero-width. This
     *     must be zero or greater.
     * @param {DWRITE_TEXT_RANGE} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a></b>
     * 
     * Text range to which this change applies.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextlayout1-setcharacterspacing
     */
    SetCharacterSpacing(leadingSpacing, trailingSpacing, minimumAdvanceWidth, textRange) {
        result := ComCall(69, this, "float", leadingSpacing, "float", trailingSpacing, "float", minimumAdvanceWidth, DWRITE_TEXT_RANGE, textRange, "HRESULT")
        return result
    }

    /**
     * Gets the spacing between characters.
     * @param {Integer} currentPosition Type: <b>UINT32</b>
     * 
     * The current text position.
     * @param {Pointer<Float>} leadingSpacing Type: <b>FLOAT*</b>
     * 
     * The spacing before each character, in reading order.
     * @param {Pointer<Float>} trailingSpacing Type: <b>FLOAT*</b>
     * 
     * The spacing after each character, in reading order.
     * @param {Pointer<Float>} minimumAdvanceWidth Type: <b>FLOAT*</b>
     * 
     * The minimum advance of each character, to prevent characters from becoming too thin or zero-width. This must be zero or greater.
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_text_range">DWRITE_TEXT_RANGE</a>*</b>
     * 
     * The position range of the current format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritetextlayout1-getcharacterspacing
     */
    GetCharacterSpacing(currentPosition, leadingSpacing, trailingSpacing, minimumAdvanceWidth, textRange) {
        leadingSpacingMarshal := leadingSpacing is VarRef ? "float*" : "ptr"
        trailingSpacingMarshal := trailingSpacing is VarRef ? "float*" : "ptr"
        minimumAdvanceWidthMarshal := minimumAdvanceWidth is VarRef ? "float*" : "ptr"

        result := ComCall(70, this, "uint", currentPosition, leadingSpacingMarshal, leadingSpacing, trailingSpacingMarshal, trailingSpacing, minimumAdvanceWidthMarshal, minimumAdvanceWidth, DWRITE_TEXT_RANGE.Ptr, textRange, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextLayout1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPairKerning := CallbackCreate(GetMethod(implObj, "SetPairKerning"), flags, 3)
        this.vtbl.GetPairKerning := CallbackCreate(GetMethod(implObj, "GetPairKerning"), flags, 4)
        this.vtbl.SetCharacterSpacing := CallbackCreate(GetMethod(implObj, "SetCharacterSpacing"), flags, 5)
        this.vtbl.GetCharacterSpacing := CallbackCreate(GetMethod(implObj, "GetCharacterSpacing"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPairKerning)
        CallbackFree(this.vtbl.GetPairKerning)
        CallbackFree(this.vtbl.SetCharacterSpacing)
        CallbackFree(this.vtbl.GetCharacterSpacing)
    }
}
