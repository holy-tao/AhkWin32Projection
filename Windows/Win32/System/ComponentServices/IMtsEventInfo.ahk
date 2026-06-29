#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Describes user-defined events.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imtseventinfo
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMtsEventInfo extends IDispatch {
    /**
     * The interface identifier for IMtsEventInfo
     * @type {Guid}
     */
    static IID := Guid("{d56c3dc1-8482-11d0-b170-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMtsEventInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Names       : IntPtr
        get_DisplayName : IntPtr
        get_EventID     : IntPtr
        get_Count       : IntPtr
        get_Value       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMtsEventInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    Names {
        get => this.get_Names()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {BSTR} 
     */
    EventID {
        get => this.get_EventID()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Retrieves an enumerator for the names of the data values.
     * @returns {IUnknown} An interface pointer to the enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_names
     */
    get_Names() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Retrieves the display name of the object.
     * @returns {BSTR} The display name of the object.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_displayname
     */
    get_DisplayName() {
        sDisplayName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, sDisplayName, "HRESULT")
        return sDisplayName
    }

    /**
     * Retrieves the event identifier of the object.
     * @returns {BSTR} The event identifier of the object. This is a GUID converted to a string.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_eventid
     */
    get_EventID() {
        sGuidEventID := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, sGuidEventID, "HRESULT")
        return sGuidEventID
    }

    /**
     * Retrieves the number of data values from the object.
     * @returns {Integer} The number of data values from the object.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &lCount := 0, "HRESULT")
        return lCount
    }

    /**
     * Retrieves the value of the specified user-defined event.
     * @param {BSTR} sKey The name or ordinal of the value.
     * @returns {VARIANT} The value of the user-defined event.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_value
     */
    get_Value(sKey) {
        sKey := sKey is String ? BSTR.Alloc(sKey).Value : sKey

        pVal := VARIANT()
        result := ComCall(11, this, BSTR, sKey, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IMtsEventInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Names := CallbackCreate(GetMethod(implObj, "get_Names"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_EventID := CallbackCreate(GetMethod(implObj, "get_EventID"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Names)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_EventID)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Value)
    }
}
