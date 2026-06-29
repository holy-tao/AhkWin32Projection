#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
export default struct IRemoteComponentUtil extends IDispatch {
    /**
     * The interface identifier for IRemoteComponentUtil
     * @type {Guid}
     */
    static IID := Guid("{6eb22875-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for RemoteComponentUtil
     * @type {Guid}
     */
    static CLSID := Guid("{6eb22886-8a19-11d0-81b6-00a0c9231c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteComponentUtil interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        InstallRemoteComponent       : IntPtr
        InstallRemoteComponentByName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteComponentUtil.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrServer 
     * @param {BSTR} bstrPackageID 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    InstallRemoteComponent(bstrServer, bstrPackageID, bstrCLSID) {
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer
        bstrPackageID := bstrPackageID is String ? BSTR.Alloc(bstrPackageID).Value : bstrPackageID
        bstrCLSID := bstrCLSID is String ? BSTR.Alloc(bstrCLSID).Value : bstrCLSID

        result := ComCall(7, this, BSTR, bstrServer, BSTR, bstrPackageID, BSTR, bstrCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServer 
     * @param {BSTR} bstrPackageName 
     * @param {BSTR} bstrProgID 
     * @returns {HRESULT} 
     */
    InstallRemoteComponentByName(bstrServer, bstrPackageName, bstrProgID) {
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer
        bstrPackageName := bstrPackageName is String ? BSTR.Alloc(bstrPackageName).Value : bstrPackageName
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        result := ComCall(8, this, BSTR, bstrServer, BSTR, bstrPackageName, BSTR, bstrProgID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteComponentUtil.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InstallRemoteComponent := CallbackCreate(GetMethod(implObj, "InstallRemoteComponent"), flags, 4)
        this.vtbl.InstallRemoteComponentByName := CallbackCreate(GetMethod(implObj, "InstallRemoteComponentByName"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InstallRemoteComponent)
        CallbackFree(this.vtbl.InstallRemoteComponentByName)
    }
}
