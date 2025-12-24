#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMStorageGlobals interface provides methods for retrieving global information about a storage medium (such as a flash ROM card) on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorageglobals
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageGlobals extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageGlobals
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a07-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "GetSerialNumber", "GetTotalSize", "GetTotalFree", "GetTotalBad", "GetStatus", "Initialize"]

    /**
     * The GetCapabilities method retrieves the capabilities of the root storage medium.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "HRESULT")
        return pdwCapabilities
    }

    /**
     * The GetSerialNumber method retrieves a serial number that uniquely identifies the storage medium.
     * @param {Pointer<Integer>} abMac Array of bytes specifying the message authentication code for the parameter data of this method. This memory is allocated and freed by the caller.
     * @returns {WMDMID} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmid">WMDMID</a> structure specifying the serial number information.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-getserialnumber
     */
    GetSerialNumber(abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        pSerialNum := WMDMID()
        result := ComCall(4, this, "ptr", pSerialNum, abMacMarshal, abMac, "HRESULT")
        return pSerialNum
    }

    /**
     * The GetTotalSize method retrieves the total size in bytes of the storage medium associated with the IWMDMStorageGlobals interface.
     * @param {Pointer<Integer>} pdwTotalSizeLow Pointer to a <b>DWORD</b> that receives the low-order value of the total size of the medium.
     * @param {Pointer<Integer>} pdwTotalSizeHigh Pointer to a <b>DWORD</b> that receives the high-order value of the total size of the medium.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalsize
     */
    GetTotalSize(pdwTotalSizeLow, pdwTotalSizeHigh) {
        pdwTotalSizeLowMarshal := pdwTotalSizeLow is VarRef ? "uint*" : "ptr"
        pdwTotalSizeHighMarshal := pdwTotalSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwTotalSizeLowMarshal, pdwTotalSizeLow, pdwTotalSizeHighMarshal, pdwTotalSizeHigh, "HRESULT")
        return result
    }

    /**
     * The GetTotalFree method retrieves the total amount of free space on the storage medium, in bytes.
     * @param {Pointer<Integer>} pdwFreeLow Pointer to a <b>DWORD</b> that receives the low-order part of the free space value.
     * @param {Pointer<Integer>} pdwFreeHigh Pointer to a <b>DWORD</b> that receives the high-order part of the free space value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalfree
     */
    GetTotalFree(pdwFreeLow, pdwFreeHigh) {
        pdwFreeLowMarshal := pdwFreeLow is VarRef ? "uint*" : "ptr"
        pdwFreeHighMarshal := pdwFreeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFreeLowMarshal, pdwFreeLow, pdwFreeHighMarshal, pdwFreeHigh, "HRESULT")
        return result
    }

    /**
     * The GetTotalBad method retrieves the total amount of unusable space on the storage medium, in bytes.
     * @param {Pointer<Integer>} pdwBadLow Pointer to a <b>DWORD</b> that receives the low-order bytes of unusable space.
     * @param {Pointer<Integer>} pdwBadHigh Pointer to a <b>DWORD</b> that receives the high-order bytes of unusable space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalbad
     */
    GetTotalBad(pdwBadLow, pdwBadHigh) {
        pdwBadLowMarshal := pdwBadLow is VarRef ? "uint*" : "ptr"
        pdwBadHighMarshal := pdwBadHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwBadLowMarshal, pdwBadLow, pdwBadHighMarshal, pdwBadHigh, "HRESULT")
        return result
    }

    /**
     * The GetStatus method retrieves the current status of a storage medium.
     * @returns {Integer} Pointer to a <b>DWORD</b> to receive the status information when the method returns. The following values can be returned in the <i>pdwStatus</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Status
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_READY</td>
     * <td>The medium is in an idle or ready state.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_BUSY</td>
     * <td>An operation is ongoing. Evaluate status values to determine the ongoing operation.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_NOTPRESENT</td>
     * <td>The storage medium is not present. For devices with more than one medium supported, this value is only reported from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_INITIALIZING</td>
     * <td>The device is currently busy formatting a storage medium on a device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_BROKEN</td>
     * <td>The storage medium is broken. For devices with more than one medium supported, this value is only reported from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_NOTSUPPORTED</td>
     * <td>The storage medium is not supported by the device. For devices with more than one medium supported, this value is only returned from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_UNFORMATTED</td>
     * <td>The storage medium is not formatted. For devices with more than one medium supported, this value is only reported from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The Initialize method formats the storage medium.
     * @param {Integer} fuMode Mode used to initialize the medium. Specify exactly one of the following two modes. If both modes are specified, block mode is used.
     * 
     * <table>
     * <tr>
     * <th>Mode
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_BLOCK</td>
     * <td>The operation is performed using block mode processing. The call will not return until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode processing. The call returns immediately, and the operation is performed in a background thread.</td>
     * </tr>
     * </table>
     * @param {IWMDMProgress} pProgress Pointer to an <b>IWMDMProgress</b> interface implemented by an application to track the progress of the formatting operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorageglobals-initialize
     */
    Initialize(fuMode, pProgress) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }
}
