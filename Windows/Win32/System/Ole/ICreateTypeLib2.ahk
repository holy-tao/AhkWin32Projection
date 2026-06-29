#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICreateTypeLib.ahk" { ICreateTypeLib }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides the methods for creating and managing the component or file that contains type information. (ICreateTypeLib2)
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-icreatetypelib2
 * @namespace Windows.Win32.System.Ole
 */
export default struct ICreateTypeLib2 extends ICreateTypeLib {
    /**
     * The interface identifier for ICreateTypeLib2
     * @type {Guid}
     */
    static IID := Guid("{0002040f-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateTypeLib2 interfaces
    */
    struct Vtbl extends ICreateTypeLib.Vtbl {
        DeleteTypeInfo       : IntPtr
        SetCustData          : IntPtr
        SetHelpStringContext : IntPtr
        SetHelpStringDll     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateTypeLib2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deletes a specified type information from the type library.
     * @param {PWSTR} szName The name of the type information to remove.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib2-deletetypeinfo
     */
    DeleteTypeInfo(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(13, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * Sets a value to custom data.
     * @param {Pointer<Guid>} guid The unique identifier for the data.
     * @param {Pointer<VARIANT>} pVarVal The data to store (any variant except an object).
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib2-setcustdata
     */
    SetCustData(guid, pVarVal) {
        result := ComCall(14, this, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return result
    }

    /**
     * Sets the Help string context number.
     * @param {Integer} dwHelpStringContext The Help string context number.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib2-sethelpstringcontext
     */
    SetHelpStringContext(dwHelpStringContext) {
        result := ComCall(15, this, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * Sets the DLL name to be used for Help string lookup (for localization purposes).
     * @param {PWSTR} szFileName The DLL file name.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib2-sethelpstringdll
     */
    SetHelpStringDll(szFileName) {
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName

        result := ComCall(16, this, "ptr", szFileName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreateTypeLib2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteTypeInfo := CallbackCreate(GetMethod(implObj, "DeleteTypeInfo"), flags, 2)
        this.vtbl.SetCustData := CallbackCreate(GetMethod(implObj, "SetCustData"), flags, 3)
        this.vtbl.SetHelpStringContext := CallbackCreate(GetMethod(implObj, "SetHelpStringContext"), flags, 2)
        this.vtbl.SetHelpStringDll := CallbackCreate(GetMethod(implObj, "SetHelpStringDll"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteTypeInfo)
        CallbackFree(this.vtbl.SetCustData)
        CallbackFree(this.vtbl.SetHelpStringContext)
        CallbackFree(this.vtbl.SetHelpStringDll)
    }
}
