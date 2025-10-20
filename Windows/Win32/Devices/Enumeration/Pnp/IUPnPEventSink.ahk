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
     * 
     * @param {Integer} cChanges 
     * @param {Pointer<Int32>} rgdispidChanges 
     * @returns {HRESULT} 
     */
    OnStateChanged(cChanges, rgdispidChanges) {
        result := ComCall(3, this, "uint", cChanges, "int*", rgdispidChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varsadispidChanges 
     * @returns {HRESULT} 
     */
    OnStateChangedSafe(varsadispidChanges) {
        result := ComCall(4, this, "ptr", varsadispidChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
