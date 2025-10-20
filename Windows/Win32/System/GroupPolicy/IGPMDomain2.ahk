#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMDomain.ahk

/**
 * Represents a given domain and supports methods that allow you to query scope of management (SOM) objects, create, restore and query Starter GPOs, and create and query WMI filters when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmdomain2
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMDomain2 extends IGPMDomain{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMDomain2
     * @type {Guid}
     */
    static IID => Guid("{7ca6bb8b-f1eb-490a-938d-3c4e51c768e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStarterGPO", "CreateGPOFromStarterGPO", "GetStarterGPO", "SearchStarterGPOs", "LoadStarterGPO", "RestoreStarterGPO"]

    /**
     * 
     * @param {Pointer<IGPMStarterGPO>} ppnewTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain2-createstartergpo
     */
    CreateStarterGPO(ppnewTemplate) {
        result := ComCall(17, this, "ptr*", ppnewTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMStarterGPO} pGPOTemplate 
     * @param {Pointer<IGPMGPO>} ppnewGPO 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain2-creategpofromstartergpo
     */
    CreateGPOFromStarterGPO(pGPOTemplate, ppnewGPO) {
        result := ComCall(18, this, "ptr", pGPOTemplate, "ptr*", ppnewGPO, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuid 
     * @param {Pointer<IGPMStarterGPO>} ppTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain2-getstartergpo
     */
    GetStarterGPO(bstrGuid, ppTemplate) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(19, this, "ptr", bstrGuid, "ptr*", ppTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @param {Pointer<IGPMStarterGPOCollection>} ppIGPMTemplateCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain2-searchstartergpos
     */
    SearchStarterGPOs(pIGPMSearchCriteria, ppIGPMTemplateCollection) {
        result := ComCall(20, this, "ptr", pIGPMSearchCriteria, "ptr*", ppIGPMTemplateCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLoadFile 
     * @param {VARIANT_BOOL} bOverwrite 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain2-loadstartergpo
     */
    LoadStarterGPO(bstrLoadFile, bOverwrite, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        bstrLoadFile := bstrLoadFile is String ? BSTR.Alloc(bstrLoadFile).Value : bstrLoadFile

        result := ComCall(21, this, "ptr", bstrLoadFile, "short", bOverwrite, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMStarterGPOBackup} pIGPMTmplBackup 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain2-restorestartergpo
     */
    RestoreStarterGPO(pIGPMTmplBackup, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(22, this, "ptr", pIGPMTmplBackup, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }
}
