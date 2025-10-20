#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to discover services on the network advertised by WS-Discovery.
 * @remarks
 * 
  * The Discovery Provider represents the "client" view of WS-Discovery.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoveryprovider
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryProvider extends IUnknown{
    /**
     * The interface identifier for IWSDiscoveryProvider
     * @type {Guid}
     */
    static IID => Guid("{8ffc8e55-f0eb-480f-88b7-b435dd281d45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwAddressFamily 
     * @returns {HRESULT} 
     */
    SetAddressFamily(dwAddressFamily) {
        result := ComCall(3, this, "uint", dwAddressFamily, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDiscoveryProviderNotify>} pSink 
     * @returns {HRESULT} 
     */
    Attach(pSink) {
        result := ComCall(4, this, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     */
    SearchById(pszId, pszTag) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszId, "ptr", pszTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAddress 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     */
    SearchByAddress(pszAddress, pszTag) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(7, this, "ptr", pszAddress, "ptr", pszTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {PWSTR} pszMatchBy 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     */
    SearchByType(pTypesList, pScopesList, pszMatchBy, pszTag) {
        pszMatchBy := pszMatchBy is String ? StrPtr(pszMatchBy) : pszMatchBy
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(8, this, "ptr", pTypesList, "ptr", pScopesList, "ptr", pszMatchBy, "ptr", pszTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDXMLContext>} ppContext 
     * @returns {HRESULT} 
     */
    GetXMLContext(ppContext) {
        result := ComCall(9, this, "ptr", ppContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
