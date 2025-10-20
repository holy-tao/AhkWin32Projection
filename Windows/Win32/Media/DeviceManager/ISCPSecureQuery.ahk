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
     * 
     * @param {Pointer<UInt32>} pfuFlags 
     * @param {Pointer<UInt32>} pdwMinRightsData 
     * @param {Pointer<UInt32>} pdwMinExamineData 
     * @param {Pointer<UInt32>} pdwMinDecideData 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    GetDataDemands(pfuFlags, pdwMinRightsData, pdwMinExamineData, pdwMinDecideData, abMac) {
        result := ComCall(3, this, "uint*", pfuFlags, "uint*", pdwMinRightsData, "uint*", pdwMinExamineData, "uint*", pdwMinDecideData, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {PWSTR} pwszExtension 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    ExamineData(fuFlags, pwszExtension, pData, dwSize, abMac) {
        pwszExtension := pwszExtension is String ? StrPtr(pwszExtension) : pwszExtension

        result := ComCall(4, this, "uint", fuFlags, "ptr", pwszExtension, "char*", pData, "uint", dwSize, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fuFlags 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwAppSec 
     * @param {Pointer<Byte>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {Pointer<IMDSPStorageGlobals>} pStorageGlobals 
     * @param {Pointer<ISCPSecureExchange>} ppExchange 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    MakeDecision(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, ppExchange, abMac) {
        result := ComCall(5, this, "uint", fuFlags, "char*", pData, "uint", dwSize, "uint", dwAppSec, "char*", pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, "ptr", ppExchange, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} dwSize 
     * @param {Pointer<Byte>} pbSPSessionKey 
     * @param {Integer} dwSessionKeyLen 
     * @param {Pointer<IMDSPStorageGlobals>} pStgGlobals 
     * @param {Pointer<WMDMRIGHTS>} ppRights 
     * @param {Pointer<UInt32>} pnRightsCount 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    GetRights(pData, dwSize, pbSPSessionKey, dwSessionKeyLen, pStgGlobals, ppRights, pnRightsCount, abMac) {
        result := ComCall(6, this, "char*", pData, "uint", dwSize, "char*", pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStgGlobals, "ptr", ppRights, "uint*", pnRightsCount, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
