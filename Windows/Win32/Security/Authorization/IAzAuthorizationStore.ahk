#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines the container that is the root of the authorization policy store.
 * @remarks
 * 
  * The <b>AzAuthorizationStore</b> object is named according to the URL passed to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-initialize">Initialize</a> method. The object has no name within  the policy store.
  * 
  * The application must ensure that the user context from which the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-initialize">Initialize</a> method is called is used for all future access to the <b>AzAuthorizationStore</b> object, except for the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken">IAzApplication::InitializeClientContextFromToken</a> method.
  * 
  * <div class="alert"><b>Note</b>  If an XML store is used over a network, the traffic is not automatically encrypted. IPsec can be used to encrypt the authorization information in transit.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazauthorizationstore
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzAuthorizationStore extends IDispatch{
    /**
     * The interface identifier for IAzAuthorizationStore
     * @type {Guid}
     */
    static IID => Guid("{edbd9ca9-9b82-4f6a-9e8b-98301e450f14}")

    /**
     * The class identifier for AzAuthorizationStore
     * @type {Guid}
     */
    static CLSID => Guid("{b2bcff59-a757-4b0b-a1bc-ea69981da69e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbstrDescription) {
        result := ComCall(7, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(8, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrApplicationData 
     * @returns {HRESULT} 
     */
    get_ApplicationData(pbstrApplicationData) {
        result := ComCall(9, this, "ptr", pbstrApplicationData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(10, this, "ptr", bstrApplicationData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProp 
     * @returns {HRESULT} 
     */
    get_DomainTimeout(plProp) {
        result := ComCall(11, this, "int*", plProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     */
    put_DomainTimeout(lProp) {
        result := ComCall(12, this, "int", lProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProp 
     * @returns {HRESULT} 
     */
    get_ScriptEngineTimeout(plProp) {
        result := ComCall(13, this, "int*", plProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     */
    put_ScriptEngineTimeout(lProp) {
        result := ComCall(14, this, "int", lProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProp 
     * @returns {HRESULT} 
     */
    get_MaxScriptEngines(plProp) {
        result := ComCall(15, this, "int*", plProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     */
    put_MaxScriptEngines(lProp) {
        result := ComCall(16, this, "int", lProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbProp 
     * @returns {HRESULT} 
     */
    get_GenerateAudits(pbProp) {
        result := ComCall(17, this, "ptr", pbProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     */
    put_GenerateAudits(bProp) {
        result := ComCall(18, this, "int", bProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     */
    get_Writable(pfProp) {
        result := ComCall(19, this, "ptr", pfProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @param {Pointer<VARIANT>} pvarProp 
     * @returns {HRESULT} 
     */
    GetProperty(lPropId, varReserved, pvarProp) {
        result := ComCall(20, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(21, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(22, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarAdmins 
     * @returns {HRESULT} 
     */
    get_PolicyAdministrators(pvarAdmins) {
        result := ComCall(24, this, "ptr", pvarAdmins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReaders 
     * @returns {HRESULT} 
     */
    get_PolicyReaders(pvarReaders) {
        result := ComCall(25, this, "ptr", pvarReaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(26, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(27, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(28, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(29, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} lFlags 
     * @param {BSTR} bstrPolicyURL 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(lFlags, bstrPolicyURL, varReserved) {
        bstrPolicyURL := bstrPolicyURL is String ? BSTR.Alloc(bstrPolicyURL).Value : bstrPolicyURL

        result := ComCall(30, this, "int", lFlags, "ptr", bstrPolicyURL, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    UpdateCache(varReserved) {
        result := ComCall(31, this, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    Delete(varReserved) {
        result := ComCall(32, this, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzApplications>} ppAppCollection 
     * @returns {HRESULT} 
     */
    get_Applications(ppAppCollection) {
        result := ComCall(33, this, "ptr", ppAppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplication>} ppApplication 
     * @returns {HRESULT} 
     */
    OpenApplication(bstrApplicationName, varReserved, ppApplication) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(34, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr", ppApplication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplication>} ppApplication 
     * @returns {HRESULT} 
     */
    CreateApplication(bstrApplicationName, varReserved, ppApplication) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(35, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr", ppApplication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteApplication(bstrApplicationName, varReserved) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(36, this, "ptr", bstrApplicationName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzApplicationGroups>} ppGroupCollection 
     * @returns {HRESULT} 
     */
    get_ApplicationGroups(ppGroupCollection) {
        result := ComCall(37, this, "ptr", ppGroupCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplicationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    CreateApplicationGroup(bstrGroupName, varReserved, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(38, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplicationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    OpenApplicationGroup(bstrGroupName, varReserved, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(39, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(40, this, "ptr", bstrGroupName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    Submit(lFlags, varReserved) {
        result := ComCall(41, this, "int", lFlags, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDelegatedPolicyUsers 
     * @returns {HRESULT} 
     */
    get_DelegatedPolicyUsers(pvarDelegatedPolicyUsers) {
        result := ComCall(42, this, "ptr", pvarDelegatedPolicyUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(43, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(44, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTargetMachine 
     * @returns {HRESULT} 
     */
    get_TargetMachine(pbstrTargetMachine) {
        result := ComCall(45, this, "ptr", pbstrTargetMachine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbApplyStoreSacl 
     * @returns {HRESULT} 
     */
    get_ApplyStoreSacl(pbApplyStoreSacl) {
        result := ComCall(46, this, "ptr", pbApplyStoreSacl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bApplyStoreSacl 
     * @returns {HRESULT} 
     */
    put_ApplyStoreSacl(bApplyStoreSacl) {
        result := ComCall(47, this, "int", bApplyStoreSacl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarAdmins 
     * @returns {HRESULT} 
     */
    get_PolicyAdministratorsName(pvarAdmins) {
        result := ComCall(48, this, "ptr", pvarAdmins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReaders 
     * @returns {HRESULT} 
     */
    get_PolicyReadersName(pvarReaders) {
        result := ComCall(49, this, "ptr", pvarReaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(50, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(51, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(52, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(53, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDelegatedPolicyUsers 
     * @returns {HRESULT} 
     */
    get_DelegatedPolicyUsersName(pvarDelegatedPolicyUsers) {
        result := ComCall(54, this, "ptr", pvarDelegatedPolicyUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(55, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(56, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationName 
     * @param {Integer} lFlag 
     * @returns {HRESULT} 
     */
    CloseApplication(bstrApplicationName, lFlag) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(57, this, "ptr", bstrApplicationName, "int", lFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
