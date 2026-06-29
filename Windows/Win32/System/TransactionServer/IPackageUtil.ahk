#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
export default struct IPackageUtil extends IDispatch {
    /**
     * The interface identifier for IPackageUtil
     * @type {Guid}
     */
    static IID := Guid("{6eb22874-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for PackageUtil
     * @type {Guid}
     */
    static CLSID := Guid("{6eb22885-8a19-11d0-81b6-00a0c9231c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPackageUtil interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        InstallPackage  : IntPtr
        ExportPackage   : IntPtr
        ShutdownPackage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPackageUtil.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrPackageFile 
     * @param {BSTR} bstrInstallPath 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     */
    InstallPackage(bstrPackageFile, bstrInstallPath, lOptions) {
        bstrPackageFile := bstrPackageFile is String ? BSTR.Alloc(bstrPackageFile).Value : bstrPackageFile
        bstrInstallPath := bstrInstallPath is String ? BSTR.Alloc(bstrInstallPath).Value : bstrInstallPath

        result := ComCall(7, this, BSTR, bstrPackageFile, BSTR, bstrInstallPath, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPackageID 
     * @param {BSTR} bstrPackageFile 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     */
    ExportPackage(bstrPackageID, bstrPackageFile, lOptions) {
        bstrPackageID := bstrPackageID is String ? BSTR.Alloc(bstrPackageID).Value : bstrPackageID
        bstrPackageFile := bstrPackageFile is String ? BSTR.Alloc(bstrPackageFile).Value : bstrPackageFile

        result := ComCall(8, this, BSTR, bstrPackageID, BSTR, bstrPackageFile, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPackageID 
     * @returns {HRESULT} 
     */
    ShutdownPackage(bstrPackageID) {
        bstrPackageID := bstrPackageID is String ? BSTR.Alloc(bstrPackageID).Value : bstrPackageID

        result := ComCall(9, this, BSTR, bstrPackageID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPackageUtil.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InstallPackage := CallbackCreate(GetMethod(implObj, "InstallPackage"), flags, 4)
        this.vtbl.ExportPackage := CallbackCreate(GetMethod(implObj, "ExportPackage"), flags, 4)
        this.vtbl.ShutdownPackage := CallbackCreate(GetMethod(implObj, "ShutdownPackage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InstallPackage)
        CallbackFree(this.vtbl.ExportPackage)
        CallbackFree(this.vtbl.ShutdownPackage)
    }
}
