#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\TrackerHandle.ahk" { TrackerHandle }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct ITrackerOwner extends IUnknown {
    /**
     * The interface identifier for ITrackerOwner
     * @type {Guid}
     */
    static IID := Guid("{eb24c20b-9816-4ac7-8cff-36f67a118f4e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITrackerOwner interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTrackerHandle    : IntPtr
        DeleteTrackerHandle    : IntPtr
        SetTrackerValue        : IntPtr
        TryGetSafeTrackerValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITrackerOwner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {TrackerHandle} 
     */
    CreateTrackerHandle() {
        result := ComCall(3, this, TrackerHandle.Ptr, &returnValue := 0, "HRESULT")
        return returnValue
    }

    /**
     * 
     * @param {TrackerHandle} _handle 
     * @returns {HRESULT} 
     */
    DeleteTrackerHandle(_handle) {
        result := ComCall(4, this, TrackerHandle, _handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {TrackerHandle} _handle 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     */
    SetTrackerValue(_handle, value) {
        result := ComCall(5, this, TrackerHandle, _handle, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {TrackerHandle} _handle 
     * @param {Pointer<IUnknown>} returnValue 
     * @returns {Integer} 
     */
    TryGetSafeTrackerValue(_handle, returnValue) {
        result := ComCall(6, this, TrackerHandle, _handle, IUnknown.Ptr, returnValue, Int8)
        return result
    }

    Query(iid) {
        if (ITrackerOwner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTrackerHandle := CallbackCreate(GetMethod(implObj, "CreateTrackerHandle"), flags, 2)
        this.vtbl.DeleteTrackerHandle := CallbackCreate(GetMethod(implObj, "DeleteTrackerHandle"), flags, 2)
        this.vtbl.SetTrackerValue := CallbackCreate(GetMethod(implObj, "SetTrackerValue"), flags, 3)
        this.vtbl.TryGetSafeTrackerValue := CallbackCreate(GetMethod(implObj, "TryGetSafeTrackerValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTrackerHandle)
        CallbackFree(this.vtbl.DeleteTrackerHandle)
        CallbackFree(this.vtbl.SetTrackerValue)
        CallbackFree(this.vtbl.TryGetSafeTrackerValue)
    }
}
