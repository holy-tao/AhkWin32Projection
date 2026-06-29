#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ITypeNameBuilder extends IUnknown {
    /**
     * The interface identifier for ITypeNameBuilder
     * @type {Guid}
     */
    static IID := Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00523}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeNameBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenGenericArguments  : IntPtr
        CloseGenericArguments : IntPtr
        OpenGenericArgument   : IntPtr
        CloseGenericArgument  : IntPtr
        AddName               : IntPtr
        AddPointer            : IntPtr
        AddByRef              : IntPtr
        AddSzArray            : IntPtr
        AddArray              : IntPtr
        AddAssemblySpec       : IntPtr
        ToString              : IntPtr
        Clear                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeNameBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArguments() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArguments() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArgument() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArgument() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    AddName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(7, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddPointer() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddByRef() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddSzArray() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rank 
     * @returns {HRESULT} 
     */
    AddArray(rank) {
        result := ComCall(11, this, "uint", rank, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szAssemblySpec 
     * @returns {HRESULT} 
     */
    AddAssemblySpec(szAssemblySpec) {
        szAssemblySpec := szAssemblySpec is String ? StrPtr(szAssemblySpec) : szAssemblySpec

        result := ComCall(12, this, "ptr", szAssemblySpec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    ToString() {
        pszStringRepresentation := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pszStringRepresentation, "HRESULT")
        return pszStringRepresentation
    }

    /**
     * Resets the TPM to its factory-default state.
     * @remarks
     * Running this method can help prepare a TPM-equipped computer for recycling.
     * 
     * To clear the TPM but no longer have the TPM owner authorization, you need physical access to the computer. The [**SetPhysicalPresenceRequest**](setphysicalpresencerequest-win32-tpm.md) method includes functionality to help clear the TPM without TPM owner authorization.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * The following table lists some of the common return codes.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                         | Description                                                                                                                                                                          |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                         | The method was successful.<br/>                                                                                                                                                |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl>              | The provided owner authorization value cannot perform the request.<br/>                                                                                                        |
     * | <dl> <dt>**TPM\_E\_DEFEND\_LOCK\_RUNNING**</dt> <dt>2150107139 (0x80280803)</dt> </dl> | The TPM is defending against dictionary attacks and is in a time-out period. For more information, see the [**ResetAuthLockOut**](resetauthlockout-win32-tpm.md) method.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/clear-win32-tpm
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITypeNameBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenGenericArguments := CallbackCreate(GetMethod(implObj, "OpenGenericArguments"), flags, 1)
        this.vtbl.CloseGenericArguments := CallbackCreate(GetMethod(implObj, "CloseGenericArguments"), flags, 1)
        this.vtbl.OpenGenericArgument := CallbackCreate(GetMethod(implObj, "OpenGenericArgument"), flags, 1)
        this.vtbl.CloseGenericArgument := CallbackCreate(GetMethod(implObj, "CloseGenericArgument"), flags, 1)
        this.vtbl.AddName := CallbackCreate(GetMethod(implObj, "AddName"), flags, 2)
        this.vtbl.AddPointer := CallbackCreate(GetMethod(implObj, "AddPointer"), flags, 1)
        this.vtbl.AddByRef := CallbackCreate(GetMethod(implObj, "AddByRef"), flags, 1)
        this.vtbl.AddSzArray := CallbackCreate(GetMethod(implObj, "AddSzArray"), flags, 1)
        this.vtbl.AddArray := CallbackCreate(GetMethod(implObj, "AddArray"), flags, 2)
        this.vtbl.AddAssemblySpec := CallbackCreate(GetMethod(implObj, "AddAssemblySpec"), flags, 2)
        this.vtbl.ToString := CallbackCreate(GetMethod(implObj, "ToString"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenGenericArguments)
        CallbackFree(this.vtbl.CloseGenericArguments)
        CallbackFree(this.vtbl.OpenGenericArgument)
        CallbackFree(this.vtbl.CloseGenericArgument)
        CallbackFree(this.vtbl.AddName)
        CallbackFree(this.vtbl.AddPointer)
        CallbackFree(this.vtbl.AddByRef)
        CallbackFree(this.vtbl.AddSzArray)
        CallbackFree(this.vtbl.AddArray)
        CallbackFree(this.vtbl.AddAssemblySpec)
        CallbackFree(this.vtbl.ToString)
        CallbackFree(this.vtbl.Clear)
    }
}
