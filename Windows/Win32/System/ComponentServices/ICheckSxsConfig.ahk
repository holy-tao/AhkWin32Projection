#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to check the configuration of the current side-by-side assembly.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-ichecksxsconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICheckSxsConfig extends IUnknown {
    /**
     * The interface identifier for ICheckSxsConfig
     * @type {Guid}
     */
    static IID := Guid("{0ff5a96f-11fc-47d1-baa6-25dd347e7242}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICheckSxsConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsSameSxsConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICheckSxsConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the side-by-side assembly has the specified configuration.
     * @param {PWSTR} wszSxsName A text string that contains the file name of the side-by-side assembly. The proper extension is added automatically.
     * @param {PWSTR} wszSxsDirectory A text string that contains the directory of the side-by-side assembly.
     * @param {PWSTR} wszSxsAppName A text string that contains the name of the application domain.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current side-by-side assembly has the specified configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current side-by-side assembly does not have the specified configuration.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ichecksxsconfig-issamesxsconfig
     */
    IsSameSxsConfig(wszSxsName, wszSxsDirectory, wszSxsAppName) {
        wszSxsName := wszSxsName is String ? StrPtr(wszSxsName) : wszSxsName
        wszSxsDirectory := wszSxsDirectory is String ? StrPtr(wszSxsDirectory) : wszSxsDirectory
        wszSxsAppName := wszSxsAppName is String ? StrPtr(wszSxsAppName) : wszSxsAppName

        result := ComCall(3, this, "ptr", wszSxsName, "ptr", wszSxsDirectory, "ptr", wszSxsAppName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICheckSxsConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsSameSxsConfig := CallbackCreate(GetMethod(implObj, "IsSameSxsConfig"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsSameSxsConfig)
    }
}
