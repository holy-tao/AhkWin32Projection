#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsComputerOperations interface is a dual interface that inherits from IADs.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadscomputeroperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsComputerOperations extends IADs {
    /**
     * The interface identifier for IADsComputerOperations
     * @type {Guid}
     */
    static IID := Guid("{ef497680-1d9f-11cf-b1f3-02608c9e7553}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsComputerOperations interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        Status   : IntPtr
        Shutdown : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsComputerOperations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IADsComputerOperations::Status method retrieves the status of a computer.
     * @returns {IDispatch} Pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface that reports the status code of computer operations. The status code is provider-specific.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscomputeroperations-status
     */
    Status() {
        result := ComCall(20, this, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * The IADsComputerOperations::Shutdown method causes a computer under ADSI control to execute the shutdown operation with an optional reboot.
     * @param {VARIANT_BOOL} bReboot If <b>TRUE</b>, then reboot the computer after the shutdown is complete.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscomputeroperations-shutdown
     */
    Shutdown(bReboot) {
        result := ComCall(21, this, VARIANT_BOOL, bReboot, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsComputerOperations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Status := CallbackCreate(GetMethod(implObj, "Status"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Status)
        CallbackFree(this.vtbl.Shutdown)
    }
}
