#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPEventSource interface allows the device host to manage event subscriptions for the hosted service.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpeventsource
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPEventSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPEventSource
     * @type {Guid}
     */
    static IID => Guid("{204810b5-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise"]

    /**
     * 
     * @param {IUPnPEventSink} pesSubscriber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsource-advise
     */
    Advise(pesSubscriber) {
        result := ComCall(3, this, "ptr", pesSubscriber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUPnPEventSink} pesSubscriber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsource-unadvise
     */
    Unadvise(pesSubscriber) {
        result := ComCall(4, this, "ptr", pesSubscriber, "HRESULT")
        return result
    }
}
