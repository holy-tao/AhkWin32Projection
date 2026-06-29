#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Adds members to the InkRecognizerContext Class.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkrecognizercontext2
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkRecognizerContext2 extends IDispatch {
    /**
     * The interface identifier for IInkRecognizerContext2
     * @type {Guid}
     */
    static IID := Guid("{d6f0e32f-73d8-408e-8e9f-5fea592c363f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkRecognizerContext2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_EnabledUnicodeRanges : IntPtr
        put_EnabledUnicodeRanges : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkRecognizerContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    EnabledUnicodeRanges {
        get => this.get_EnabledUnicodeRanges()
        set => this.put_EnabledUnicodeRanges(value)
    }

    /**
     * Gets or sets a set of one or more Unicode ranges that the recognizer context will support. (Get)
     * @remarks
     * Use this method to specify a sub-set of Unicode character ranges that the recognizer should use during recognition. This is particularly useful when working with Asian character set where only a sub-set of the characters are commonly used.
     * 
     * Your application should check whether all input ranges are supported by the recognizer. TPC_S_TRUNCATED is returned to indicate that the Unicode ranges passed in were accepted, with the exception of those which were not valid. You can call <b>get_EnabledUnicodeRanges</b> to determine the ranges that were accepted.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext2-get_enabledunicoderanges
     */
    get_EnabledUnicodeRanges() {
        UnicodeRanges := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, UnicodeRanges, "HRESULT")
        return UnicodeRanges
    }

    /**
     * Gets or sets a set of one or more Unicode ranges that the recognizer context will support. (Put)
     * @remarks
     * Use this method to specify a sub-set of Unicode character ranges that the recognizer should use during recognition. This is particularly useful when working with Asian character set where only a sub-set of the characters are commonly used.
     * 
     * Your application should check whether all input ranges are supported by the recognizer. TPC_S_TRUNCATED is returned to indicate that the Unicode ranges passed in were accepted, with the exception of those which were not valid. You can call <b>get_EnabledUnicodeRanges</b> to determine the ranges that were accepted.
     * @param {VARIANT} UnicodeRanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext2-put_enabledunicoderanges
     */
    put_EnabledUnicodeRanges(UnicodeRanges) {
        result := ComCall(8, this, VARIANT, UnicodeRanges, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkRecognizerContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EnabledUnicodeRanges := CallbackCreate(GetMethod(implObj, "get_EnabledUnicodeRanges"), flags, 2)
        this.vtbl.put_EnabledUnicodeRanges := CallbackCreate(GetMethod(implObj, "put_EnabledUnicodeRanges"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EnabledUnicodeRanges)
        CallbackFree(this.vtbl.put_EnabledUnicodeRanges)
    }
}
