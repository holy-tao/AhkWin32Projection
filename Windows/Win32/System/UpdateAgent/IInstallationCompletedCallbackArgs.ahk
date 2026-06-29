#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * Contains information about the completion of an installation and acts as a parameter to the IInstallationCompletedCallback delegate. The download and installation of the update is asynchronous.
 * @remarks
 * The <b>IInstallationCompletedCallbackArgs</b> interface is reserved for future use. It  has no properties or methods.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationcompletedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationCompletedCallbackArgs extends IDispatch {
    /**
     * The interface identifier for IInstallationCompletedCallbackArgs
     * @type {Guid}
     */
    static IID := Guid("{250e2106-8efb-4705-9653-ef13c581b6a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationCompletedCallbackArgs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationCompletedCallbackArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IInstallationCompletedCallbackArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
