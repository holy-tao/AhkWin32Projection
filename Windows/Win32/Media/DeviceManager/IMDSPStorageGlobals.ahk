#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include .\IMDSPDevice.ahk
#Include .\IMDSPStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorageGlobals interface, acquired from the IMDSPStorage interface, provides methods for retrieving global information about a storage medium. This might include the amount of free space, serial number of the medium, and so on.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorageglobals
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorageGlobals extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorageGlobals
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a17-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "GetSerialNumber", "GetTotalSize", "GetTotalFree", "GetTotalBad", "GetStatus", "Initialize", "GetDevice", "GetRootStorage"]

    /**
     * The GetCapabilities method retrieves the capabilities of the storage medium that an instance of this interface is associated with.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the capabilities of the storage medium.
     * 
     * The following flags can be returned in the <i>pdwCapabilities</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_FOLDERSINROOT</td>
     * <td>The medium supports folders in the root of storage.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_FILESINROOT</td>
     * <td>The medium supports files in the root of storage.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_FOLDERSINFOLDERS</td>
     * <td>The medium supports folders in folders.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_FILESINFOLDERS</td>
     * <td>The medium supports files in folders.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_FOLDERLIMITEXISTS</td>
     * <td>There is an arbitrary count limit for the number of folders allowed per the form of folder support by the medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_FILELIMITEXISTS</td>
     * <td>There is an arbitrary count limit for the number of files allowed per the form of file support by the medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGECAP_NOT_INITIALIZABLE</td>
     * <td>The medium cannot be initialized. By default, the top-level storage can be initialized.</td>
     * </tr>
     * </table>
     *  
     * 
     * For secured device implementations, the following flags describing the rights capabilities of the medium can also be returned.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_RIGHTS_PLAYBACKCOUNT</td>
     * <td>The medium supports playback count limiting for content.</td>
     * </tr>
     * <tr>
     * <td>WMDM_RIGHTS_EXPIRATIONDATE</td>
     * <td>The medium supports expiration date tracking for content.</td>
     * </tr>
     * <tr>
     * <td>WMDM_RIGHTS_FREESERIALIDS</td>
     * <td>The medium supports a free serial identifier for the file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_RIGHTS_GROUPID</td>
     * <td>The medium supports a group identifier for the file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_RIGHTS_NAMEDSERIALIDS</td>
     * <td>The medium supports a named serial identifier for the file.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "HRESULT")
        return pdwCapabilities
    }

    /**
     * The GetSerialNumber method retrieves a serial number uniquely identifying the storage medium. This method must be implemented for protected content transfer, but otherwise it is optional. For more information, see Mandatory and Optional Interfaces.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {WMDMID} Pointer to a <b>WMDMID</b> structure containing the serial number information. This parameter is included in the output message authentication code.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-getserialnumber
     */
    GetSerialNumber(abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        pSerialNum := WMDMID()
        result := ComCall(4, this, "ptr", pSerialNum, abMacMarshal, abMac, "HRESULT")
        return pSerialNum
    }

    /**
     * The GetTotalSize method retrieves the total size, in bytes, of the medium associated with this IMDSPStorageGlobals interface.
     * @param {Pointer<Integer>} pdwTotalSizeLow Pointer to a <b>DWORD</b> containing the low-order bytes of the total size of the medium.
     * @param {Pointer<Integer>} pdwTotalSizeHigh Pointer to a <b>DWORD</b> containing the high-order bytes of the total size of the medium.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-gettotalsize
     */
    GetTotalSize(pdwTotalSizeLow, pdwTotalSizeHigh) {
        pdwTotalSizeLowMarshal := pdwTotalSizeLow is VarRef ? "uint*" : "ptr"
        pdwTotalSizeHighMarshal := pdwTotalSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwTotalSizeLowMarshal, pdwTotalSizeLow, pdwTotalSizeHighMarshal, pdwTotalSizeHigh, "HRESULT")
        return result
    }

    /**
     * The GetTotalFree method retrieves the total free space on the storage medium, in bytes.
     * @param {Pointer<Integer>} pdwFreeLow Pointer to a <b>DWORD</b> containing the low-order bytes of the free space.
     * @param {Pointer<Integer>} pdwFreeHigh Pointer to a <b>DWORD</b> containing the high-order bytes of the free space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-gettotalfree
     */
    GetTotalFree(pdwFreeLow, pdwFreeHigh) {
        pdwFreeLowMarshal := pdwFreeLow is VarRef ? "uint*" : "ptr"
        pdwFreeHighMarshal := pdwFreeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFreeLowMarshal, pdwFreeLow, pdwFreeHighMarshal, pdwFreeHigh, "HRESULT")
        return result
    }

    /**
     * The GetTotalBad method retrieves the total amount of unusable space on the storage medium, in bytes.
     * @param {Pointer<Integer>} pdwBadLow Pointer to a <b>DWORD</b> containing the low-order bytes of the unusable space.
     * @param {Pointer<Integer>} pdwBadHigh Pointer to a <b>DWORD</b> containing the high-order bytes of the unusable space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-gettotalbad
     */
    GetTotalBad(pdwBadLow, pdwBadHigh) {
        pdwBadLowMarshal := pdwBadLow is VarRef ? "uint*" : "ptr"
        pdwBadHighMarshal := pdwBadHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwBadLowMarshal, pdwBadLow, pdwBadHighMarshal, pdwBadHigh, "HRESULT")
        return result
    }

    /**
     * The GetStatus method retrieves the current status of the storage medium.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the status information. The following status values can be returned by the <i>pdwStatus</i> parameter.
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
     * <td>The medium is in an idle ready state.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_BUSY</td>
     * <td>An operation is ongoing. Evaluate status values to determine the ongoing operation.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_NOTPRESENT</td>
     * <td>The medium is not present. For devices that support more than one medium, this value is only reported from the <b>IMDSPStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_INITIALIZING</td>
     * <td>The device is currently busy formatting media on a device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_BROKEN</td>
     * <td>The medium is broken. For devices that support more than one medium, this value is only reported from the <b>IMDSPStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_NOTSUPPORTED</td>
     * <td>The medium is not supported by the device. For devices that support more than one medium, this value is only returned from the <b>IMDSPStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_UNFORMATTED</td>
     * <td>The medium is not formatted. For devices that support more than one medium, this value is only reported from the <b>IMDSPStorageGlobals</b> interface.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-getstatus
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
     * <td>The operation is performed using block mode processing. The call is not returned until the operation is finished.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_THREAD</td>
     * <td>The operation is performed using thread mode processing. The call returns immediately and the operation is performed in a background thread.</td>
     * </tr>
     * </table>
     * @param {IWMDMProgress} pProgress Pointer to an <b>IWMDMProgress</b> interface implemented by an application to track the progress of the formatting operation. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-initialize
     */
    Initialize(fuMode, pProgress) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * The GetDevice method retrieves a pointer to the device on which the storage medium with which this interface is associated is mounted.
     * @returns {IMDSPDevice} Pointer to a device identified by the <b>IMDSPDevice</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-getdevice
     */
    GetDevice() {
        result := ComCall(10, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IMDSPDevice(ppDevice)
    }

    /**
     * The GetRootStorage method retrieves a pointer to the IMDSPStorage interface for the root storage of the storage medium.
     * @returns {IMDSPStorage} Pointer to an <b>IMDSPStorage</b> pointer that receives the root storage.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspstorageglobals-getrootstorage
     */
    GetRootStorage() {
        result := ComCall(11, this, "ptr*", &ppRoot := 0, "HRESULT")
        return IMDSPStorage(ppRoot)
    }
}
