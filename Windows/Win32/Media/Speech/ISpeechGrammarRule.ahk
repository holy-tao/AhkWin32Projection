#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechGrammarRuleState.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechGrammarRule
     * @type {Guid}
     */
    static IID => Guid("{afe719cf-5dd1-44f2-999c-7a399f1cfccc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Attributes", "get_InitialState", "get_Name", "get_Id", "Clear", "AddResource", "AddState"]

    /**
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * @type {ISpeechGrammarRuleState} 
     */
    InitialState {
        get => this.get_InitialState()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Attributes() {
        result := ComCall(7, this, "int*", &Attributes := 0, "HRESULT")
        return Attributes
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    get_InitialState() {
        result := ComCall(8, this, "ptr*", &State := 0, "HRESULT")
        return ISpeechGrammarRuleState(State)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(9, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(10, this, "int*", &Id := 0, "HRESULT")
        return Id
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
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Adds a SYSTEM_RESOURCE_ATTRIBUTE_ACEaccess control entry (ACE) to the end of a system access control list (SACL).
     * @param {BSTR} ResourceName 
     * @param {BSTR} ResourceValue 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addresourceattributeace
     */
    AddResource(ResourceName, ResourceValue) {
        ResourceName := ResourceName is String ? BSTR.Alloc(ResourceName).Value : ResourceName
        ResourceValue := ResourceValue is String ? BSTR.Alloc(ResourceValue).Value : ResourceValue

        result := ComCall(12, this, "ptr", ResourceName, "ptr", ResourceValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    AddState() {
        result := ComCall(13, this, "ptr*", &State := 0, "HRESULT")
        return ISpeechGrammarRuleState(State)
    }
}
