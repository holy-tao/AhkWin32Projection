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
     * The OnStateChanged method sends an event to the device host with the list of DISPIDs of the state variables that have changed. The device host must query the service object to obtain the new value for each state variable that has changed.
     * @param {Integer} cChanges Specifies the number of variables in <i>rgdispidChanges</i>. The value indicates the number of variables whose values have changed.
     * @param {Pointer<Integer>} rgdispidChanges Contains a list of the DISPIDs of the state variables that have changed. The number of elements in this buffer is specified by <i>cChanges</i>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * 
     * If <i>cChanges</i> is zero or <i>rgdispidChanges</i> is <b>NULL</b>, E_INVALIDARG is returned.
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpeventsink-onstatechanged
     */
    OnStateChanged(cChanges, rgdispidChanges) {
        rgdispidChangesMarshal := rgdispidChanges is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, rgdispidChangesMarshal, rgdispidChanges, "HRESULT")
        return result
    }

    /**
     * The OnStateChangedSafe method sends an event to the device host with the list of DISPIDs that have changed. The device host must query the service object to obtain the new value for each state variable that has changed.
     * @param {VARIANT} varsadispidChanges Contains a safearray of the DISPIDs of the state variables that have changed.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpeventsink-onstatechangedsafe
     */
    OnStateChangedSafe(varsadispidChanges) {
        result := ComCall(4, this, "ptr", varsadispidChanges, "HRESULT")
        return result
    }
}
