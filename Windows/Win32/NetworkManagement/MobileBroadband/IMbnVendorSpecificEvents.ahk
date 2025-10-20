#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This notification interface signals an application of the completion status of vendor-specific operations and other vendor-specific changes in the device state.
 * @remarks
 * 
  * The following procedure describes how to register for notifications.
  * 
  * <ol>
  * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnVendorSpecificEvents</b> to <i>riid</i>.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnVendorSpecificEvents</b> to <i>pUnk</i>.</li>
  * </ol>
  * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
  * 
  * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnvendorspecificevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnVendorSpecificEvents extends IUnknown{
    /**
     * The interface identifier for IMbnVendorSpecificEvents
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-201a-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMbnVendorSpecificOperation>} vendorOperation 
     * @param {Pointer<SAFEARRAY>} vendorSpecificData 
     * @returns {HRESULT} 
     */
    OnEventNotification(vendorOperation, vendorSpecificData) {
        result := ComCall(3, this, "ptr", vendorOperation, "ptr", vendorSpecificData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnVendorSpecificOperation>} vendorOperation 
     * @param {Pointer<SAFEARRAY>} vendorSpecificData 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     */
    OnSetVendorSpecificComplete(vendorOperation, vendorSpecificData, requestID) {
        result := ComCall(4, this, "ptr", vendorOperation, "ptr", vendorSpecificData, "uint", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
