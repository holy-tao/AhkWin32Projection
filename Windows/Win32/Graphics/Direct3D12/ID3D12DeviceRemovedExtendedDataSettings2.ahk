#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12DeviceRemovedExtendedDataSettings1.ahk" { ID3D12DeviceRemovedExtendedDataSettings1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceRemovedExtendedDataSettings2 extends ID3D12DeviceRemovedExtendedDataSettings1 {
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedDataSettings2
     * @type {Guid}
     */
    static IID := Guid("{61552388-01ab-4008-a436-83db189566ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceRemovedExtendedDataSettings2 interfaces
    */
    struct Vtbl extends ID3D12DeviceRemovedExtendedDataSettings1.Vtbl {
        UseMarkersOnlyAutoBreadcrumbs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceRemovedExtendedDataSettings2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} MarkersOnly 
     * @returns {String} Nothing - always returns an empty string
     */
    UseMarkersOnlyAutoBreadcrumbs(MarkersOnly) {
        ComCall(7, this, BOOL, MarkersOnly)
    }

    Query(iid) {
        if (ID3D12DeviceRemovedExtendedDataSettings2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UseMarkersOnlyAutoBreadcrumbs := CallbackCreate(GetMethod(implObj, "UseMarkersOnlyAutoBreadcrumbs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UseMarkersOnlyAutoBreadcrumbs)
    }
}
