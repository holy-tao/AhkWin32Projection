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
     * 
     * @param {Pointer<IGPMStarterGPO>} ppnewTemplate 
     * @returns {HRESULT} 
     */
    CreateStarterGPO(ppnewTemplate) {
        result := ComCall(17, this, "ptr", ppnewTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMStarterGPO>} pGPOTemplate 
     * @param {Pointer<IGPMGPO>} ppnewGPO 
     * @returns {HRESULT} 
     */
    CreateGPOFromStarterGPO(pGPOTemplate, ppnewGPO) {
        result := ComCall(18, this, "ptr", pGPOTemplate, "ptr", ppnewGPO, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuid 
     * @param {Pointer<IGPMStarterGPO>} ppTemplate 
     * @returns {HRESULT} 
     */
    GetStarterGPO(bstrGuid, ppTemplate) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(19, this, "ptr", bstrGuid, "ptr", ppTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMSearchCriteria>} pIGPMSearchCriteria 
     * @param {Pointer<IGPMStarterGPOCollection>} ppIGPMTemplateCollection 
     * @returns {HRESULT} 
     */
    SearchStarterGPOs(pIGPMSearchCriteria, ppIGPMTemplateCollection) {
        result := ComCall(20, this, "ptr", pIGPMSearchCriteria, "ptr", ppIGPMTemplateCollection, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    LoadStarterGPO(bstrLoadFile, bOverwrite, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        bstrLoadFile := bstrLoadFile is String ? BSTR.Alloc(bstrLoadFile).Value : bstrLoadFile

        result := ComCall(21, this, "ptr", bstrLoadFile, "short", bOverwrite, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMStarterGPOBackup>} pIGPMTmplBackup 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    RestoreStarterGPO(pIGPMTmplBackup, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(22, this, "ptr", pIGPMTmplBackup, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
