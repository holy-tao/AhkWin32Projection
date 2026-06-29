#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMsmDependency interface retrieves details for a single module dependency.
 * @see https://learn.microsoft.com/windows/win32/api/mergemod/nn-mergemod-imsmdependency
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IMsmDependency extends IDispatch {
    /**
     * The interface identifier for IMsmDependency
     * @type {Guid}
     */
    static IID := Guid("{0adda82b-2c26-11d2-ad65-00a0c9af11a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMsmDependency interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Module   : IntPtr
        get_Language : IntPtr
        get_Version  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMsmDependency.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    Module {
        get => this.get_Module()
    }

    /**
     */
    Language {
        get => this.get_Language()
    }

    /**
     */
    Version {
        get => this.get_Version()
    }

    /**
     * The get_Module method retrieves the Module property of the Dependency object. This method returns the ModuleID of the module required by the current string in the form of a BSTR. The ModuleID is of the same form as used in the ModuleSignature table.
     * @remarks
     * The client is responsible for freeing the resulting string using <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} Module A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Module is null
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmdependency-get_module
     */
    get_Module(Module) {
        result := ComCall(7, this, BSTR.Ptr, Module, "HRESULT")
        return result
    }

    /**
     * The get_Language method retrieves the Language property of the Dependency object. This method returns the LANGID of the required module.
     * @param {Pointer<Integer>} Language A pointer to a location in memory that receives the language.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Language is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmdependency-get_language
     */
    get_Language(Language) {
        LanguageMarshal := Language is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, LanguageMarshal, Language, "HRESULT")
        return result
    }

    /**
     * The get_Version method retrieves the Version property of the Dependency object. This method returns the version of the required module in the form of a BSTR.
     * @remarks
     * The client is responsible for freeing the resulting string using <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} _Version A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmdependency-get_version
     */
    get_Version(_Version) {
        result := ComCall(9, this, BSTR.Ptr, _Version, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMsmDependency.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Module := CallbackCreate(GetMethod(implObj, "get_Module"), flags, 2)
        this.vtbl.get_Language := CallbackCreate(GetMethod(implObj, "get_Language"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Module)
        CallbackFree(this.vtbl.get_Language)
        CallbackFree(this.vtbl.get_Version)
    }
}
