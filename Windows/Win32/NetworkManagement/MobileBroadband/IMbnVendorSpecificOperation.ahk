#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Interface to pass requests from an application to the underlying Mobile Broadband miniport drivers.
 * @remarks
 * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnvendorspecificoperation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnVendorSpecificOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnVendorSpecificOperation
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2019-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVendorSpecific"]

    /**
     * Sends a request to the underlying Mobile Broadband device miniport driver.
     * @remarks
     * <b>SetVendorSpecific</b> exists to implement vendor-specific functionality which is not otherwise covered in the Mobile Broadband API.
     * 
     * The Mobile Broadband service will issue a SET OID request to the underlying miniport driver for OID_WWAN_VENDOR_SPECIFIC OID.  <i>VendorspecificData</i> will be copied byte by byte into the data buffer passed in the OID request.
     * 
     * This is an asynchronous operation and <b>SetVendorSpecific</b> will return immediately.  On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnvendorspecificevents-onsetvendorspecificcomplete">OnSetVendorSpecificComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnvendorspecificevents">IMbnVendorSpecificEvents</a> interface.
     * 
     * Refer to  the Mobile Broadband Driver Model for more information about vendor specific operations.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A byte array that is passed in to the miniport driver.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnvendorspecificoperation-setvendorspecific
     */
    SetVendorSpecific(vendorSpecificData) {
        result := ComCall(3, this, "ptr", vendorSpecificData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
