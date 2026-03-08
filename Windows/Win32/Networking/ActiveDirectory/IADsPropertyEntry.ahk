#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPropertyEntry interface is used to manage a property entry in the property cache.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspropertyentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPropertyEntry
     * @type {Guid}
     */
    static IID => Guid("{05792c8e-941f-11d0-8529-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clear", "get_Name", "put_Name", "get_ADsType", "put_ADsType", "get_ControlCode", "put_ControlCode", "get_Values", "put_Values"]

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
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "HRESULT")
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
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vValues 
     * @returns {HRESULT} 
     */
    put_Values(vValues) {
        result := ComCall(15, this, "ptr", vValues, "HRESULT")
        return result
    }
}
