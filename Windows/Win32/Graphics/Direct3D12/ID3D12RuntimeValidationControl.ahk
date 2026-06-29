#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12RuntimeValidationControl extends IUnknown {
    /**
     * The interface identifier for ID3D12RuntimeValidationControl
     * @type {Guid}
     */
    static IID := Guid("{c706c811-3663-4bf1-91b9-1e8a7c114ab9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12RuntimeValidationControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DisableFailuresFromStricterValidationInAppLocalRuntime  : IntPtr
        FailuresFromStricterValidationInAppLocalRuntimeDisabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12RuntimeValidationControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} bDisable 
     * @returns {String} Nothing - always returns an empty string
     */
    DisableFailuresFromStricterValidationInAppLocalRuntime(bDisable) {
        ComCall(3, this, BOOL, bDisable)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    FailuresFromStricterValidationInAppLocalRuntimeDisabled() {
        result := ComCall(4, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D12RuntimeValidationControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DisableFailuresFromStricterValidationInAppLocalRuntime := CallbackCreate(GetMethod(implObj, "DisableFailuresFromStricterValidationInAppLocalRuntime"), flags, 2)
        this.vtbl.FailuresFromStricterValidationInAppLocalRuntimeDisabled := CallbackCreate(GetMethod(implObj, "FailuresFromStricterValidationInAppLocalRuntimeDisabled"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DisableFailuresFromStricterValidationInAppLocalRuntime)
        CallbackFree(this.vtbl.FailuresFromStricterValidationInAppLocalRuntimeDisabled)
    }
}
