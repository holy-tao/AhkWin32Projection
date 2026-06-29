#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_FILTER_CHANGE.ahk" { SYNC_FILTER_CHANGE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFilterTrackingSyncChangeBuilder extends IUnknown {
    /**
     * The interface identifier for IFilterTrackingSyncChangeBuilder
     * @type {Guid}
     */
    static IID := Guid("{295024a0-70da-4c58-883c-ce2afb308d0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterTrackingSyncChangeBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddFilterChange              : IntPtr
        SetAllChangeUnitsPresentFlag : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterTrackingSyncChangeBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<SYNC_FILTER_CHANGE>} pFilterChange 
     * @returns {HRESULT} 
     */
    AddFilterChange(dwFilterKey, pFilterChange) {
        result := ComCall(3, this, "uint", dwFilterKey, SYNC_FILTER_CHANGE.Ptr, pFilterChange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAllChangeUnitsPresentFlag() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterTrackingSyncChangeBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddFilterChange := CallbackCreate(GetMethod(implObj, "AddFilterChange"), flags, 3)
        this.vtbl.SetAllChangeUnitsPresentFlag := CallbackCreate(GetMethod(implObj, "SetAllChangeUnitsPresentFlag"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddFilterChange)
        CallbackFree(this.vtbl.SetAllChangeUnitsPresentFlag)
    }
}
