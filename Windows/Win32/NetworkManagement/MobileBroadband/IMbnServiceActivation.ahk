#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Pass-through mechanism for cellular service activation.
 * @remarks
 * An <b>IMbnServiceActivation</b> interface can be obtained by calling <b>QueryInterface</b>  from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnserviceactivation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnServiceActivation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnServiceActivation
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2017-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate"]

    /**
     * Send the service activation request to the network.
     * @remarks
     * The <b>Activate</b> method can be used by an application to activate cellular service. The format of data passed in this request is vendor-specific.
     * 
     * The <b>VendorSpecificBufferSize</b> field of the OID request would be set to the size of data in the SAFEARRAY,  <i>vendorSpecificData</i>. The contents of <i>vendorSpecificData</i> will be copied byte-by-byte in the OID request to the driver.
     * 
     * Refer to the Mobile Broadband Driver Model for more information about service activation operations.
     * 
     * 
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnserviceactivationevents-onactivationcomplete">OnActivationComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnserviceactivationevents">IMbnServiceActivationEvents</a> interface.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A vendor-specific array of bytes passed in a service activation operation. This data will be passed by the Mobile Broadband service in a SET OID_WWAN_SERVICE_ACTIVATION  OID request to the miniport driver.
     * @returns {Integer} The request ID for this operation.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnserviceactivation-activate
     */
    Activate(vendorSpecificData) {
        result := ComCall(3, this, "ptr", vendorSpecificData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
