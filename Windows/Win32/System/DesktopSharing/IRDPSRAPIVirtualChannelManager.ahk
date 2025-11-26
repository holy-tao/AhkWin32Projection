#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IRDPSRAPIVirtualChannel.ahk
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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * An enumerator interface for the virtual channel collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * An item in the virtual channel collection.
     * @param {VARIANT} item 
     * @returns {IRDPSRAPIVirtualChannel} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-get_item
     */
    get_Item(item) {
        result := ComCall(8, this, "ptr", item, "ptr*", &pChannel := 0, "HRESULT")
        return IRDPSRAPIVirtualChannel(pChannel)
    }

    /**
     * Creates a virtual channel.
     * @param {BSTR} bstrChannelName Type: <b>BSTR</b>
     * 
     * The name of the channel. The maximum length is 8 characters, including the null-terminating character. Legacy channel names are limited to 32 characters.
     * @param {Integer} Priority Type: <b>CHANNEL_PRIORITY</b>
     * @param {Integer} ChannelFlags Type: <b>unsigned long</b>
     * 
     * Flags that determine how data is sent on the channel. This parameter can be 0 or <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_flags">CHANNEL_FLAGS_UNCOMPRESSED</a>.
     * @returns {IRDPSRAPIVirtualChannel} Type: <b>IRDPSRAPIVirtualChannel**</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapivirtualchannel">IRDPSRAPIVirtualChannel</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannelmanager-createvirtualchannel
     */
    CreateVirtualChannel(bstrChannelName, Priority, ChannelFlags) {
        bstrChannelName := bstrChannelName is String ? BSTR.Alloc(bstrChannelName).Value : bstrChannelName

        result := ComCall(9, this, "ptr", bstrChannelName, "int", Priority, "uint", ChannelFlags, "ptr*", &ppChannel := 0, "HRESULT")
        return IRDPSRAPIVirtualChannel(ppChannel)
    }
}
