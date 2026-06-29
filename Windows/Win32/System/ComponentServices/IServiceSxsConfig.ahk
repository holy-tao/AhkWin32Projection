#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CSC_SxsConfig.ahk" { CSC_SxsConfig }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures side-by-side assemblies for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicesxsconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceSxsConfig extends IUnknown {
    /**
     * The interface identifier for IServiceSxsConfig
     * @type {Guid}
     */
    static IID := Guid("{c7cd7379-f3f2-4634-811b-703281d73e08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceSxsConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SxsConfig    : IntPtr
        SxsName      : IntPtr
        SxsDirectory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceSxsConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the side-by-side assembly for the enclosed work.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsdirectory">SxsDirectory</a> method must be called if a new side-by-side assembly domain is created using a call to this method.
     * @param {CSC_SxsConfig} scsConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_sxsconfig">CSC_SxsConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsconfig
     */
    SxsConfig(scsConfig) {
        result := ComCall(3, this, CSC_SxsConfig, scsConfig, "HRESULT")
        return result
    }

    /**
     * Sets the file name of the side-by-side assembly for the enclosed work.
     * @remarks
     * The appropriate file name extension will be added to the <i>szSxsName</i> parameter. A default file name is used if this method is not called.
     * @param {PWSTR} szSxsName The file name for the side-by-side assembly.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsname
     */
    SxsName(szSxsName) {
        szSxsName := szSxsName is String ? StrPtr(szSxsName) : szSxsName

        result := ComCall(4, this, "ptr", szSxsName, "HRESULT")
        return result
    }

    /**
     * Sets the directory for the side-by-side assembly for the enclosed work.
     * @remarks
     * This method must be called if a new side-by-side assembly domain is created using the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsconfig">SxsConfig</a>.
     * @param {PWSTR} szSxsDirectory The name of the directory for the side-by-side assembly that is to be used for the enclosed work.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsdirectory
     */
    SxsDirectory(szSxsDirectory) {
        szSxsDirectory := szSxsDirectory is String ? StrPtr(szSxsDirectory) : szSxsDirectory

        result := ComCall(5, this, "ptr", szSxsDirectory, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceSxsConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SxsConfig := CallbackCreate(GetMethod(implObj, "SxsConfig"), flags, 2)
        this.vtbl.SxsName := CallbackCreate(GetMethod(implObj, "SxsName"), flags, 2)
        this.vtbl.SxsDirectory := CallbackCreate(GetMethod(implObj, "SxsDirectory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SxsConfig)
        CallbackFree(this.vtbl.SxsName)
        CallbackFree(this.vtbl.SxsDirectory)
    }
}
