#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPNAT interface is the primary interface for managing Network Address Translation (NAT) with UPnP. The IUPnPNAT interface provides access directly or indirectly to all the other interfaces in the NAT API with UPnP technology.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-iupnpnat
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IUPnPNAT extends IDispatch{
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
     * 
     * @param {Pointer<IStaticPortMappingCollection>} ppSPMs 
     * @returns {HRESULT} 
     */
    get_StaticPortMappingCollection(ppSPMs) {
        result := ComCall(7, this, "ptr", ppSPMs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDynamicPortMappingCollection>} ppDPMs 
     * @returns {HRESULT} 
     */
    get_DynamicPortMappingCollection(ppDPMs) {
        result := ComCall(8, this, "ptr", ppDPMs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INATEventManager>} ppNEM 
     * @returns {HRESULT} 
     */
    get_NATEventManager(ppNEM) {
        result := ComCall(9, this, "ptr", ppNEM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
