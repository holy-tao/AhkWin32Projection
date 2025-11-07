#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IStaticPortMapping.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IStaticPortMappingCollection interface provides methods to manage the collection of static port mappings.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-istaticportmappingcollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IStaticPortMappingCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStaticPortMappingCollection
     * @type {Guid}
     */
    static IID => Guid("{cd1f3e77-66d6-4664-82c7-36dbb641d0f1}")

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
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {IStaticPortMapping} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-get_item
     */
    get_Item(lExternalPort, bstrProtocol) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(8, this, "int", lExternalPort, "ptr", bstrProtocol, "ptr*", &ppSPM := 0, "HRESULT")
        return IStaticPortMapping(ppSPM)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-remove
     */
    Remove(lExternalPort, bstrProtocol) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(10, this, "int", lExternalPort, "ptr", bstrProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lInternalPort 
     * @param {BSTR} bstrInternalClient 
     * @param {VARIANT_BOOL} bEnabled 
     * @param {BSTR} bstrDescription 
     * @returns {IStaticPortMapping} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-add
     */
    Add(lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(11, this, "int", lExternalPort, "ptr", bstrProtocol, "int", lInternalPort, "ptr", bstrInternalClient, "short", bEnabled, "ptr", bstrDescription, "ptr*", &ppSPM := 0, "HRESULT")
        return IStaticPortMapping(ppSPM)
    }
}
