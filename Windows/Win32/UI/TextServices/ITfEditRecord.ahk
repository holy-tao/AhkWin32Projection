#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumTfRanges.ahk" { IEnumTfRanges }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GET_TEXT_AND_PROPERTY_UPDATES_FLAGS.ahk" { GET_TEXT_AND_PROPERTY_UPDATES_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfEditRecord interface is implemented by the TSF manager and is used by a text edit sink to determine what was changed during an edit session.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfeditrecord
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfEditRecord extends IUnknown {
    /**
     * The interface identifier for ITfEditRecord
     * @type {Guid}
     */
    static IID := Guid("{42d4d099-7c1a-4a89-b836-6c6f22160df0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfEditRecord interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSelectionStatus        : IntPtr
        GetTextAndPropertyUpdates : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfEditRecord.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfEditRecord::GetSelectionStatus method
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a value that indicates if the selection changed due to an edit session. Receives a nonzero value if the selection changed or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfeditrecord-getselectionstatus
     */
    GetSelectionStatus() {
        result := ComCall(3, this, BOOL.Ptr, &pfChanged := 0, "HRESULT")
        return pfChanged
    }

    /**
     * ITfEditRecord::GetTextAndPropertyUpdates method
     * @param {GET_TEXT_AND_PROPERTY_UPDATES_FLAGS} dwFlags 
     * @param {Pointer<Pointer<Guid>>} prgProperties Pointer to an array of <b>GUID</b> values that identify the properties to search for changes for. This method searches the properties that changed during the edit session and, if the property is contained in this array, a range object that covers the property that changed is added to <i>ppEnum</i>.
     * 
     * This array must be at least <i>cProperties</i> elements in size.
     * 
     * This parameter is ignored if <i>dwFlags</i> contains TF_GTP_INCL_TEXT and <i>cProperties</i> is zero.
     * @param {Integer} cProperties Specifies the number of elements in the <i>prgProperties</i> array.
     * 
     * This parameter can be zero if <i>dwFlags</i> contains TF_GTP_INCL_TEXT. This indicates that no property changes are obtained.
     * @returns {IEnumTfRanges} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfranges">IEnumTfRanges</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfeditrecord-gettextandpropertyupdates
     */
    GetTextAndPropertyUpdates(dwFlags, prgProperties, cProperties) {
        prgPropertiesMarshal := prgProperties is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, dwFlags, prgPropertiesMarshal, prgProperties, "uint", cProperties, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfRanges(ppEnum)
    }

    Query(iid) {
        if (ITfEditRecord.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSelectionStatus := CallbackCreate(GetMethod(implObj, "GetSelectionStatus"), flags, 2)
        this.vtbl.GetTextAndPropertyUpdates := CallbackCreate(GetMethod(implObj, "GetTextAndPropertyUpdates"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSelectionStatus)
        CallbackFree(this.vtbl.GetTextAndPropertyUpdates)
    }
}
