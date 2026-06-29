#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables registration of an apartment shutdown notification handler.
 * @remarks
 * Implement the <b>IApartmentShutdown</b> interface to use the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roregisterforapartmentshutdown">RoRegisterForApartmentShutdown</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iapartmentshutdown
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IApartmentShutdown extends IUnknown {
    /**
     * The interface identifier for IApartmentShutdown
     * @type {Guid}
     */
    static IID := Guid("{a2f05a09-27a2-42b5-bc0e-ac163ef49d9b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApartmentShutdown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUninitialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApartmentShutdown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when a registered apartment is shut down.
     * @param {Integer} ui64ApartmentIdentifier The apartment Identifier of the apartment that is shutting down
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iapartmentshutdown-onuninitialize
     */
    OnUninitialize(ui64ApartmentIdentifier) {
        ComCall(3, this, "uint", ui64ApartmentIdentifier)
    }

    Query(iid) {
        if (IApartmentShutdown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUninitialize := CallbackCreate(GetMethod(implObj, "OnUninitialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUninitialize)
    }
}
