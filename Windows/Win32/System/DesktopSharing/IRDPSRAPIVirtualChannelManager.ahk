#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the list of virtual channels.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapivirtualchannelmanager
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIVirtualChannelManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIVirtualChannelManager
     * @type {Guid}
     */
    static IID => Guid("{0d11c661-5d0d-4ee4-89df-2166ae1fdfed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "CreateVirtualChannel"]

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} item 
     * @param {Pointer<IRDPSRAPIVirtualChannel>} pChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-get_item
     */
    get_Item(item, pChannel) {
        result := ComCall(8, this, "ptr", item, "ptr*", pChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrChannelName 
     * @param {Integer} Priority 
     * @param {Integer} ChannelFlags 
     * @param {Pointer<IRDPSRAPIVirtualChannel>} ppChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-createvirtualchannel
     */
    CreateVirtualChannel(bstrChannelName, Priority, ChannelFlags, ppChannel) {
        bstrChannelName := bstrChannelName is String ? BSTR.Alloc(bstrChannelName).Value : bstrChannelName

        result := ComCall(9, this, "ptr", bstrChannelName, "int", Priority, "uint", ChannelFlags, "ptr*", ppChannel, "HRESULT")
        return result
    }
}
