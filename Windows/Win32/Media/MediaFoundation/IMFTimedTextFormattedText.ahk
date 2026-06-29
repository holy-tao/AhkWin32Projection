#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFTimedTextStyle.ahk" { IMFTimedTextStyle }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a block of formatted timed-text.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtextformattedtext
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextFormattedText extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextFormattedText
     * @type {Guid}
     */
    static IID := Guid("{e13af3c1-4d47-4354-b1f5-e83ae0ecae60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextFormattedText interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetText               : IntPtr
        GetSubformattingCount : IntPtr
        GetSubformatting      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextFormattedText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the text in the formatted timed-text object.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the text.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-gettext
     */
    GetText() {
        result := ComCall(3, this, PWSTR.Ptr, &text := 0, "HRESULT")
        return text
    }

    /**
     * Gets the number of subformats in the formatted timed-text object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the number of subformats.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-getsubformattingcount
     */
    GetSubformattingCount() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * Gets a subformat in the formatted timed-text object.
     * @param {Integer} index Type: <b>DWORD</b>
     * 
     * The index of the subformat in the formatted timed-text object.
     * @param {Pointer<Integer>} firstChar Type: <b>DWORD*</b>
     * 
     * A pointer to a variable that receives the first character of the subformat.
     * @param {Pointer<Integer>} charLength Type: <b>DWORD*</b>
     * 
     * A pointer to a variable that receives the length, in characters, of the subformat.
     * @param {Pointer<IMFTimedTextStyle>} style Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle">IMFTimedTextStyle</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle">IMFTimedTextStyle</a> interface for the subformat's timed-text style. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-getsubformatting
     */
    GetSubformatting(index, firstChar, charLength, style) {
        firstCharMarshal := firstChar is VarRef ? "uint*" : "ptr"
        charLengthMarshal := charLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", index, firstCharMarshal, firstChar, charLengthMarshal, charLength, IMFTimedTextStyle.Ptr, style, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFTimedTextFormattedText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 2)
        this.vtbl.GetSubformattingCount := CallbackCreate(GetMethod(implObj, "GetSubformattingCount"), flags, 1)
        this.vtbl.GetSubformatting := CallbackCreate(GetMethod(implObj, "GetSubformatting"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.GetSubformattingCount)
        CallbackFree(this.vtbl.GetSubformatting)
    }
}
