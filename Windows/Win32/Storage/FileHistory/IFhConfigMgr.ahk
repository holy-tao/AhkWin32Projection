#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhConfigMgr interface allows client applications to read and modify the File History configuration for the user account under which the methods of this interface are called.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nn-fhcfg-ifhconfigmgr
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhConfigMgr extends IUnknown{
    /**
     * The interface identifier for IFhConfigMgr
     * @type {Guid}
     */
    static IID => Guid("{6a5fea5b-bf8f-4ee5-b8c3-44d8a0d7331c}")

    /**
     * The class identifier for FhConfigMgr
     * @type {Guid}
     */
    static CLSID => Guid("{ed43bb3c-09e9-498a-9df6-2177244c6db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    LoadConfiguration() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} OverwriteIfExists 
     * @returns {HRESULT} 
     */
    CreateDefaultConfiguration(OverwriteIfExists) {
        result := ComCall(4, this, "int", OverwriteIfExists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveConfiguration() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Add 
     * @param {Integer} Category 
     * @param {BSTR} Item 
     * @returns {HRESULT} 
     */
    AddRemoveExcludeRule(Add, Category, Item) {
        Item := Item is String ? BSTR.Alloc(Item).Value : Item

        result := ComCall(6, this, "int", Add, "int", Category, "ptr", Item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Include 
     * @param {Integer} Category 
     * @param {Pointer<IFhScopeIterator>} Iterator 
     * @returns {HRESULT} 
     */
    GetIncludeExcludeRules(Include, Category, Iterator) {
        result := ComCall(7, this, "int", Include, "int", Category, "ptr", Iterator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LocalPolicyType 
     * @param {Pointer<UInt64>} PolicyValue 
     * @returns {HRESULT} 
     */
    GetLocalPolicy(LocalPolicyType, PolicyValue) {
        result := ComCall(8, this, "int", LocalPolicyType, "uint*", PolicyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LocalPolicyType 
     * @param {Integer} PolicyValue 
     * @returns {HRESULT} 
     */
    SetLocalPolicy(LocalPolicyType, PolicyValue) {
        result := ComCall(9, this, "int", LocalPolicyType, "uint", PolicyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} BackupStatus 
     * @returns {HRESULT} 
     */
    GetBackupStatus(BackupStatus) {
        result := ComCall(10, this, "int*", BackupStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BackupStatus 
     * @returns {HRESULT} 
     */
    SetBackupStatus(BackupStatus) {
        result := ComCall(11, this, "int", BackupStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFhTarget>} DefaultTarget 
     * @returns {HRESULT} 
     */
    GetDefaultTarget(DefaultTarget) {
        result := ComCall(12, this, "ptr", DefaultTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TargetUrl 
     * @param {Pointer<Int32>} ValidationResult 
     * @returns {HRESULT} 
     */
    ValidateTarget(TargetUrl, ValidationResult) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(13, this, "ptr", TargetUrl, "int*", ValidationResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TargetUrl 
     * @param {BSTR} TargetName 
     * @returns {HRESULT} 
     */
    ProvisionAndSetNewTarget(TargetUrl, TargetName) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(14, this, "ptr", TargetUrl, "ptr", TargetName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Recommend 
     * @returns {HRESULT} 
     */
    ChangeDefaultTargetRecommendation(Recommend) {
        result := ComCall(15, this, "int", Recommend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ProtectionState 
     * @param {Pointer<BSTR>} ProtectedUntilTime 
     * @returns {HRESULT} 
     */
    QueryProtectionStatus(ProtectionState, ProtectedUntilTime) {
        result := ComCall(16, this, "uint*", ProtectionState, "ptr", ProtectedUntilTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
