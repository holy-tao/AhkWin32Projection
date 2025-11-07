#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IDynamicPortMapping.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IDynamicPortMappingCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicPortMappingCollection
     * @type {Guid}
     */
    static IID => Guid("{b60de00f-156e-4e8d-9ec1-3a2342c10899}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Remove", "Add"]

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {IDynamicPortMapping} 
     */
    get_Item(bstrRemoteHost, lExternalPort, bstrProtocol) {
        bstrRemoteHost := bstrRemoteHost is String ? BSTR.Alloc(bstrRemoteHost).Value : bstrRemoteHost
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(8, this, "ptr", bstrRemoteHost, "int", lExternalPort, "ptr", bstrProtocol, "ptr*", &ppDPM := 0, "HRESULT")
        return IDynamicPortMapping(ppDPM)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {HRESULT} 
     */
    Remove(bstrRemoteHost, lExternalPort, bstrProtocol) {
        bstrRemoteHost := bstrRemoteHost is String ? BSTR.Alloc(bstrRemoteHost).Value : bstrRemoteHost
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(10, this, "ptr", bstrRemoteHost, "int", lExternalPort, "ptr", bstrProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lInternalPort 
     * @param {BSTR} bstrInternalClient 
     * @param {VARIANT_BOOL} bEnabled 
     * @param {BSTR} bstrDescription 
     * @param {Integer} lLeaseDuration 
     * @returns {IDynamicPortMapping} 
     */
    Add(bstrRemoteHost, lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription, lLeaseDuration) {
        bstrRemoteHost := bstrRemoteHost is String ? BSTR.Alloc(bstrRemoteHost).Value : bstrRemoteHost
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(11, this, "ptr", bstrRemoteHost, "int", lExternalPort, "ptr", bstrProtocol, "int", lInternalPort, "ptr", bstrInternalClient, "short", bEnabled, "ptr", bstrDescription, "int", lLeaseDuration, "ptr*", &ppDPM := 0, "HRESULT")
        return IDynamicPortMapping(ppDPM)
    }
}
