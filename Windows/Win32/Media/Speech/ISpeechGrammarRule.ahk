#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SpeechRuleAttributes.ahk" { SpeechRuleAttributes }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechGrammarRuleState.ahk" { ISpeechGrammarRuleState }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechGrammarRule extends IDispatch {
    /**
     * The interface identifier for ISpeechGrammarRule
     * @type {Guid}
     */
    static IID := Guid("{afe719cf-5dd1-44f2-999c-7a399f1cfccc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechGrammarRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Attributes   : IntPtr
        get_InitialState : IntPtr
        get_Name         : IntPtr
        get_Id           : IntPtr
        Clear            : IntPtr
        AddResource      : IntPtr
        AddState         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechGrammarRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {SpeechRuleAttributes} 
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
     * @returns {SpeechRuleAttributes} 
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
        Name := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, Name, "HRESULT")
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
     * 
     * @param {BSTR} ResourceName 
     * @param {BSTR} ResourceValue 
     * @returns {HRESULT} 
     */
    AddResource(ResourceName, ResourceValue) {
        ResourceName := ResourceName is String ? BSTR.Alloc(ResourceName).Value : ResourceName
        ResourceValue := ResourceValue is String ? BSTR.Alloc(ResourceValue).Value : ResourceValue

        result := ComCall(12, this, BSTR, ResourceName, BSTR, ResourceValue, "HRESULT")
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

    Query(iid) {
        if (ISpeechGrammarRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Attributes := CallbackCreate(GetMethod(implObj, "get_Attributes"), flags, 2)
        this.vtbl.get_InitialState := CallbackCreate(GetMethod(implObj, "get_InitialState"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddResource := CallbackCreate(GetMethod(implObj, "AddResource"), flags, 3)
        this.vtbl.AddState := CallbackCreate(GetMethod(implObj, "AddState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Attributes)
        CallbackFree(this.vtbl.get_InitialState)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddResource)
        CallbackFree(this.vtbl.AddState)
    }
}
