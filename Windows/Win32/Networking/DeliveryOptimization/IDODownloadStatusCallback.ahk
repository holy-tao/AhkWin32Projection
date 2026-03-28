#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to receive notifications about a download.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nn-deliveryoptimization-idodownloadstatuscallback
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class IDODownloadStatusCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDODownloadStatusCallback
     * @type {Guid}
     */
    static IID => Guid("{d166e8e3-a90e-4392-8e87-05e996d3747d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStatusChange"]

    /**
     * Delivery Optimization calls your implementation of this method any time a download status has changed.
     * @param {IDODownload} download An pointer to the **IDODownload** interface whose status changed.
     * @param {Pointer<DO_DOWNLOAD_STATUS>} _status 
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownloadstatuscallback-onstatuschange
     */
    OnStatusChange(download, _status) {
        result := ComCall(3, this, "ptr", download, "ptr", _status, "HRESULT")
        return result
    }
}
