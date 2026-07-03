#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes provider state methods that are implemented by third parties.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwpcproviderstate
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWPCProviderState extends IUnknown {
    /**
     * The interface identifier for IWPCProviderState
     * @type {Guid}
     */
    static IID := Guid("{50b6a267-c4bd-450b-adb5-759073837c9e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWPCProviderState interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Enable  : IntPtr
        Disable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWPCProviderState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the third-party application that it has been selected as the new current provider.
     * @remarks
     * This method is called when the current provider is changed through the drop-down list in the Parental Controls Control Panel.
     * @returns {HRESULT} If the method succeeds, the function returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderstate-enable
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Notifies the third-party application that it is not the current provider.
     * @remarks
     * This method is called for every registered provider when the current provider changes. This means that the <b>Disable</b> method may be called for a provider that has already been disabled.
     * @returns {HRESULT} If the method succeeds, the function returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderstate-disable
     */
    Disable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWPCProviderState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 1)
        this.vtbl.Disable := CallbackCreate(GetMethod(implObj, "Disable"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.Disable)
    }
}
