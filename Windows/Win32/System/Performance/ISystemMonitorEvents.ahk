#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct ISystemMonitorEvents extends IUnknown {
    /**
     * The interface identifier for ISystemMonitorEvents
     * @type {Guid}
     */
    static IID := Guid("{ee660ea0-4abd-11cf-943a-008029004347}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISystemMonitorEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCounterSelected : IntPtr
        OnCounterAdded    : IntPtr
        OnCounterDeleted  : IntPtr
        OnSampleCollected : IntPtr
        OnDblClick        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISystemMonitorEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCounterSelected(Index) {
        ComCall(3, this, "int", Index)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCounterAdded(Index) {
        ComCall(4, this, "int", Index)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCounterDeleted(Index) {
        ComCall(5, this, "int", Index)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnSampleCollected() {
        ComCall(6, this)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    OnDblClick(Index) {
        ComCall(7, this, "int", Index)
    }

    Query(iid) {
        if (ISystemMonitorEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCounterSelected := CallbackCreate(GetMethod(implObj, "OnCounterSelected"), flags, 2)
        this.vtbl.OnCounterAdded := CallbackCreate(GetMethod(implObj, "OnCounterAdded"), flags, 2)
        this.vtbl.OnCounterDeleted := CallbackCreate(GetMethod(implObj, "OnCounterDeleted"), flags, 2)
        this.vtbl.OnSampleCollected := CallbackCreate(GetMethod(implObj, "OnSampleCollected"), flags, 1)
        this.vtbl.OnDblClick := CallbackCreate(GetMethod(implObj, "OnDblClick"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCounterSelected)
        CallbackFree(this.vtbl.OnCounterAdded)
        CallbackFree(this.vtbl.OnCounterDeleted)
        CallbackFree(this.vtbl.OnSampleCollected)
        CallbackFree(this.vtbl.OnDblClick)
    }
}
