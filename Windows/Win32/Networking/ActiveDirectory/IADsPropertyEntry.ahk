#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsPropertyEntry interface is used to manage a property entry in the property cache.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspropertyentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPropertyEntry extends IDispatch {
    /**
     * The interface identifier for IADsPropertyEntry
     * @type {Guid}
     */
    static IID := Guid("{05792c8e-941f-11d0-8529-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPropertyEntry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Clear           : IntPtr
        get_Name        : IntPtr
        put_Name        : IntPtr
        get_ADsType     : IntPtr
        put_ADsType     : IntPtr
        get_ControlCode : IntPtr
        put_ControlCode : IntPtr
        get_Values      : IntPtr
        put_Values      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPropertyEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Integer} 
     */
    ADsType {
        get => this.get_ADsType()
        set => this.put_ADsType(value)
    }

    /**
     * @type {Integer} 
     */
    ControlCode {
        get => this.get_ControlCode()
        set => this.put_ControlCode(value)
    }

    /**
     * @type {VARIANT} 
     */
    Values {
        get => this.get_Values()
        set => this.put_Values(value)
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
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ADsType() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnADsType 
     * @returns {HRESULT} 
     */
    put_ADsType(lnADsType) {
        result := ComCall(11, this, "int", lnADsType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlCode() {
        result := ComCall(12, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnControlCode 
     * @returns {HRESULT} 
     */
    put_ControlCode(lnControlCode) {
        result := ComCall(13, this, "int", lnControlCode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Values() {
        retval := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vValues 
     * @returns {HRESULT} 
     */
    put_Values(vValues) {
        result := ComCall(15, this, VARIANT, vValues, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPropertyEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_ADsType := CallbackCreate(GetMethod(implObj, "get_ADsType"), flags, 2)
        this.vtbl.put_ADsType := CallbackCreate(GetMethod(implObj, "put_ADsType"), flags, 2)
        this.vtbl.get_ControlCode := CallbackCreate(GetMethod(implObj, "get_ControlCode"), flags, 2)
        this.vtbl.put_ControlCode := CallbackCreate(GetMethod(implObj, "put_ControlCode"), flags, 2)
        this.vtbl.get_Values := CallbackCreate(GetMethod(implObj, "get_Values"), flags, 2)
        this.vtbl.put_Values := CallbackCreate(GetMethod(implObj, "put_Values"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_ADsType)
        CallbackFree(this.vtbl.put_ADsType)
        CallbackFree(this.vtbl.get_ControlCode)
        CallbackFree(this.vtbl.put_ControlCode)
        CallbackFree(this.vtbl.get_Values)
        CallbackFree(this.vtbl.put_Values)
    }
}
