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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadConfiguration", "CreateDefaultConfiguration", "SaveConfiguration", "AddRemoveExcludeRule", "GetIncludeExcludeRules", "GetLocalPolicy", "SetLocalPolicy", "GetBackupStatus", "SetBackupStatus", "GetDefaultTarget", "ValidateTarget", "ProvisionAndSetNewTarget", "ChangeDefaultTargetRecommendation", "QueryProtectionStatus"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-loadconfiguration
     */
    LoadConfiguration() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} OverwriteIfExists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-createdefaultconfiguration
     */
    CreateDefaultConfiguration(OverwriteIfExists) {
        result := ComCall(4, this, "int", OverwriteIfExists, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-saveconfiguration
     */
    SaveConfiguration() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Add 
     * @param {Integer} Category 
     * @param {BSTR} Item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-addremoveexcluderule
     */
    AddRemoveExcludeRule(Add, Category, Item) {
        Item := Item is String ? BSTR.Alloc(Item).Value : Item

        result := ComCall(6, this, "int", Add, "int", Category, "ptr", Item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Include 
     * @param {Integer} Category 
     * @param {Pointer<IFhScopeIterator>} Iterator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-getincludeexcluderules
     */
    GetIncludeExcludeRules(Include, Category, Iterator) {
        result := ComCall(7, this, "int", Include, "int", Category, "ptr*", Iterator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LocalPolicyType 
     * @param {Pointer<Integer>} PolicyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-getlocalpolicy
     */
    GetLocalPolicy(LocalPolicyType, PolicyValue) {
        result := ComCall(8, this, "int", LocalPolicyType, "uint*", PolicyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LocalPolicyType 
     * @param {Integer} PolicyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy
     */
    SetLocalPolicy(LocalPolicyType, PolicyValue) {
        result := ComCall(9, this, "int", LocalPolicyType, "uint", PolicyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} BackupStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-getbackupstatus
     */
    GetBackupStatus(BackupStatus) {
        result := ComCall(10, this, "int*", BackupStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BackupStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-setbackupstatus
     */
    SetBackupStatus(BackupStatus) {
        result := ComCall(11, this, "int", BackupStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFhTarget>} DefaultTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-getdefaulttarget
     */
    GetDefaultTarget(DefaultTarget) {
        result := ComCall(12, this, "ptr*", DefaultTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TargetUrl 
     * @param {Pointer<Integer>} ValidationResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-validatetarget
     */
    ValidateTarget(TargetUrl, ValidationResult) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(13, this, "ptr", TargetUrl, "int*", ValidationResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TargetUrl 
     * @param {BSTR} TargetName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-provisionandsetnewtarget
     */
    ProvisionAndSetNewTarget(TargetUrl, TargetName) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(14, this, "ptr", TargetUrl, "ptr", TargetName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Recommend 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-changedefaulttargetrecommendation
     */
    ChangeDefaultTargetRecommendation(Recommend) {
        result := ComCall(15, this, "int", Recommend, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ProtectionState 
     * @param {Pointer<BSTR>} ProtectedUntilTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhconfigmgr-queryprotectionstatus
     */
    QueryProtectionStatus(ProtectionState, ProtectedUntilTime) {
        result := ComCall(16, this, "uint*", ProtectionState, "ptr", ProtectedUntilTime, "HRESULT")
        return result
    }
}
