#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides static functions for VPN plug-ins.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnchannelstatics
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannelStatics
     * @type {Guid}
     */
    static IID => Guid("{88eb062d-e818-4ffd-98a6-363e3736c95d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessEventAsync"]

    /**
     * A VPN plug-in must always call this function in its background tasks Run() method.
     * @param {IInspectable} thirdPartyPlugIn The plug-in to be processed.
     * @param {IInspectable} event The event object that was passed to the app from a background task **Run** method parameter. App code calling [ProcessEventAsync](vpnchannel_processeventasync_1190258170.md) treats this object as an opaque blob it is passing from the background task to the event processing code. (In the event processing code, the object will be understood and parsed appropriately.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnchannelstatics.processeventasync
     */
    ProcessEventAsync(thirdPartyPlugIn, event) {
        result := ComCall(6, this, "ptr", thirdPartyPlugIn, "ptr", event, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
