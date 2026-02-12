#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMStorageGlobals interface provides methods for retrieving global information about a storage medium (such as a flash ROM card) on a device.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-iwmdmstorageglobals
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCapabilities
    }

    /**
     * The GetSerialNumber method retrieves a serial number that uniquely identifies the storage medium.
     * @remarks
     * Not all storage media support serial numbers, but a serial number is required to support Microsoft digital rights management. If the storage medium cannot report a unique serial number, content protected by Microsoft digital rights management cannot be transferred to this storage medium. The return code should be checked to determine whether the storage medium provides this support.
     * @param {Pointer<Integer>} abMac Array of bytes specifying the message authentication code for the parameter data of this method. This memory is allocated and freed by the caller.
     * @returns {WMDMID} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmid">WMDMID</a> structure specifying the serial number information.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-getserialnumber
     */
    GetSerialNumber(abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        pSerialNum := WMDMID()
        result := ComCall(4, this, "ptr", pSerialNum, abMacMarshal, abMac, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalsize
     */
    GetTotalSize(pdwTotalSizeLow, pdwTotalSizeHigh) {
        pdwTotalSizeLowMarshal := pdwTotalSizeLow is VarRef ? "uint*" : "ptr"
        pdwTotalSizeHighMarshal := pdwTotalSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwTotalSizeLowMarshal, pdwTotalSizeLow, pdwTotalSizeHighMarshal, pdwTotalSizeHigh, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetTotalFree method retrieves the total amount of free space on the storage medium, in bytes.
     * @remarks
     * To determine the amount of storage space in use by the medium for file management, subtract the number of bad bytes retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalbad">GetTotalBad</a> from the number of free bytes retrieved using <b>GetTotalFree</b>.
     * @param {Pointer<Integer>} pdwFreeLow Pointer to a <b>DWORD</b> that receives the low-order part of the free space value.
     * @param {Pointer<Integer>} pdwFreeHigh Pointer to a <b>DWORD</b> that receives the high-order part of the free space value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalfree
     */
    GetTotalFree(pdwFreeLow, pdwFreeHigh) {
        pdwFreeLowMarshal := pdwFreeLow is VarRef ? "uint*" : "ptr"
        pdwFreeHighMarshal := pdwFreeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFreeLowMarshal, pdwFreeLow, pdwFreeHighMarshal, pdwFreeHigh, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetTotalBad method retrieves the total amount of unusable space on the storage medium, in bytes. (IWMDMStorageGlobals.GetTotalBad)
     * @remarks
     * To determine the amount of storage space in use by the medium for file management, subtract the number of bad bytes retrieved using <b>GetTotalBad</b> from the number of free bytes retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalfree">GetTotalFree</a>.
     * @param {Pointer<Integer>} pdwBadLow Pointer to a <b>DWORD</b> that receives the low-order bytes of unusable space.
     * @param {Pointer<Integer>} pdwBadHigh Pointer to a <b>DWORD</b> that receives the high-order bytes of unusable space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalbad
     */
    GetTotalBad(pdwBadLow, pdwBadHigh) {
        pdwBadLowMarshal := pdwBadLow is VarRef ? "uint*" : "ptr"
        pdwBadHighMarshal := pdwBadHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwBadLowMarshal, pdwBadLow, pdwBadHighMarshal, pdwBadHigh, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetStatus method retrieves the current status of a storage medium.
     * @remarks
     * This method must always be called before the caller attempts to interact with a storage medium. The status value retrieved is WMDM_STATUS_BUSY if some other interface has invoked an ongoing operation. You can evaluate the value retrieved from this call to determine whether an ongoing operation has been invoked from the <b>IWMDMStorageGlobals</b> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "uint*", &pdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStatus
    }

    /**
     * The Initialize method formats the storage medium. (IWMDMStorageGlobals.Initialize)
     * @remarks
     * If an application uses WMDM_MODE_THREAD and passes a non-null <i>pProgress</i> parameter, the application must ensure that the object to which <i>pProgress</i> belongs is not destroyed until the read operation completes, because Windows Media Device Manager will send progress notifications to this object. This object can be destroyed only after it receives an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmprogress-end">End</a> notification. Failure to do this will result in access violations.
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-iwmdmstorageglobals-initialize
     */
    Initialize(fuMode, pProgress) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
