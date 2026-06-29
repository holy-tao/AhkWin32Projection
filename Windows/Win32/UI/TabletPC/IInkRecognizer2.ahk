#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Adds members to the IInkWordList2 Interface.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkrecognizer2
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkRecognizer2 extends IDispatch {
    /**
     * The interface identifier for IInkRecognizer2
     * @type {Guid}
     */
    static IID := Guid("{6110118a-3a75-4ad6-b2aa-04b2b72bbe65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkRecognizer2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id            : IntPtr
        get_UnicodeRanges : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkRecognizer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {VARIANT} 
     */
    UnicodeRanges {
        get => this.get_UnicodeRanges()
    }

    /**
     * Retrieves the ID for the InkRecognizer.
     * @remarks
     * To access this method, first create and instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext Class</a>, then call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer2">IInkRecognizer2 Interface</a>. Use this pointer to call the <b>get_Id</b> method.
     * @returns {BSTR} A BSTR containing the ID of the recognizer.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer2-get_id
     */
    get_Id() {
        pbstrId := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * Retrieves the Unicode ranges set for the current recognizer.
     * @returns {VARIANT} A VARIANT array containing the Unicode ranges being used by the recognizer. An array (VT_ARRAY) of long integers (VT_ARRAY|VT_UI4). The array consists of alternating pairs for each range. For each pair in the array, the first value specifies the low Unicode code point in the range of supported Unicode points, and the second value specifies the number of Unicode points in the range.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer2-get_unicoderanges
     */
    get_UnicodeRanges() {
        UnicodeRanges := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, UnicodeRanges, "HRESULT")
        return UnicodeRanges
    }

    Query(iid) {
        if (IInkRecognizer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_UnicodeRanges := CallbackCreate(GetMethod(implObj, "get_UnicodeRanges"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_UnicodeRanges)
    }
}
