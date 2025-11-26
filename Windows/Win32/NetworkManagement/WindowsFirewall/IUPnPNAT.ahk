#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStaticPortMappingCollection.ahk
#Include .\IDynamicPortMappingCollection.ahk
#Include .\INATEventManager.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPNAT interface is the primary interface for managing Network Address Translation (NAT) with UPnP. The IUPnPNAT interface provides access directly or indirectly to all the other interfaces in the NAT API with UPnP technology.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-iupnpnat
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IUPnPNAT extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPNAT
     * @type {Guid}
     */
    static IID => Guid("{b171c812-cc76-485a-94d8-b6b3a2794e99}")

    /**
     * The class identifier for UPnPNAT
     * @type {Guid}
     */
    static CLSID => Guid("{ae1e00aa-3fd5-403c-8a27-2bbdc30cd0e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StaticPortMappingCollection", "get_DynamicPortMappingCollection", "get_NATEventManager"]

    /**
     * @type {IStaticPortMappingCollection} 
     */
    StaticPortMappingCollection {
        get => this.get_StaticPortMappingCollection()
    }

    /**
     * @type {IDynamicPortMappingCollection} 
     */
    DynamicPortMappingCollection {
        get => this.get_DynamicPortMappingCollection()
    }

    /**
     * @type {INATEventManager} 
     */
    NATEventManager {
        get => this.get_NATEventManager()
    }

    /**
     * 
     * @returns {IStaticPortMappingCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-iupnpnat-get_staticportmappingcollection
     */
    get_StaticPortMappingCollection() {
        result := ComCall(7, this, "ptr*", &ppSPMs := 0, "HRESULT")
        return IStaticPortMappingCollection(ppSPMs)
    }

    /**
     * 
     * @returns {IDynamicPortMappingCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nn-natupnp-iupnpnat
     */
    get_DynamicPortMappingCollection() {
        result := ComCall(8, this, "ptr*", &ppDPMs := 0, "HRESULT")
        return IDynamicPortMappingCollection(ppDPMs)
    }

    /**
     * 
     * @returns {INATEventManager} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-iupnpnat-get_nateventmanager
     */
    get_NATEventManager() {
        result := ComCall(9, this, "ptr*", &ppNEM := 0, "HRESULT")
        return INATEventManager(ppNEM)
    }
}
