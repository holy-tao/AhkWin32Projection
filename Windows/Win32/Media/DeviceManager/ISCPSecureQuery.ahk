#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSecureQuery interface is queried by Windows Media Device Manager to determine ownership of secured content.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsecurequery
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSecureQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSecureQuery
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0d-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDataDemands", "ExamineData", "MakeDecision", "GetRights"]

    /**
     * 
     * @param {Pointer<Integer>} pfuFlags 
     * @param {Pointer<Integer>} pdwMinRightsData 
     * @param {Pointer<Integer>} pdwMinExamineData 
     * @param {Pointer<Integer>} pdwMinDecideData 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery-getdatademands
     */
    GetDataDemands(pfuFlags, pdwMinRightsData, pdwMinExamineData, pdwMinDecideData, abMac) {
        pfuFlagsMarshal := pfuFlags is VarRef ? "uint*" : "ptr"
        pdwMinRightsDataMarshal := pdwMinRightsData is VarRef ? "uint*" : "ptr"
        pdwMinExamineDataMarshal := pdwMinExamineData is VarRef ? "uint*" : "ptr"
        pdwMinDecideDataMarshal := pdwMinDecideData is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pfuFlagsMarshal, pfuFlags, pdwMinRightsDataMarshal, pdwMinRightsData, pdwMinExamineDataMarshal, pdwMinExamineData, pdwMinDecideDataMarshal, pdwMinDecideData, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {PWSTR} pwszExtension 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery-examinedata
     */
    ExamineData(fuFlags, pwszExtension, pData, dwSize, abMac) {
        pwszExtension := pwszExtension is String ? StrPtr(pwszExtension) : pwszExtension

        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", fuFlags, "ptr", pwszExtension, pDataMarshal, pData, "uint", dwSize, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwAppSec 
     * @param {Pointer<Integer>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {IMDSPStorageGlobals} pStorageGlobals 
     * @param {Pointer<ISCPSecureExchange>} ppExchange 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery-makedecision
     */
    MakeDecision(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, ppExchange, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", fuFlags, pDataMarshal, pData, "uint", dwSize, "uint", dwAppSec, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "ptr*", ppExchange, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {IMDSPStorageGlobals} pStgGlobals 
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights 
     * @param {Pointer<Integer>} pnRightsCount 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery-getrights
     */
    GetRights(pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, ppRights, pnRightsCount, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pDataMarshal, pData, "uint", dwSize, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStgGlobals, "ptr*", ppRights, pnRightsCountMarshal, pnRightsCount, abMacMarshal, abMac, "HRESULT")
        return result
    }
}
