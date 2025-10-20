#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPEventSink interface allows a hosted service to send event notifications to the device host.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpeventsink
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPEventSink
     * @type {Guid}
     */
    static IID => Guid("{204810b4-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStateChanged", "OnStateChangedSafe"]

    /**
     * 
     * @param {Integer} cChanges 
     * @param {Pointer<Integer>} rgdispidChanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsink-onstatechanged
     */
    OnStateChanged(cChanges, rgdispidChanges) {
        result := ComCall(3, this, "uint", cChanges, "int*", rgdispidChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varsadispidChanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsink-onstatechangedsafe
     */
    OnStateChangedSafe(varsadispidChanges) {
        result := ComCall(4, this, "ptr", varsadispidChanges, "HRESULT")
        return result
    }
}
