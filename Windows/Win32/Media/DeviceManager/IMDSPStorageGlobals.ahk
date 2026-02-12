#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include .\IMDSPDevice.ahk
#Include .\IMDSPStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorageGlobals interface, acquired from the IMDSPStorage interface, provides methods for retrieving global information about a storage medium. This might include the amount of free space, serial number of the medium, and so on.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdspstorageglobals
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
     * @remarks
     * Attempts to perform unsupported operations on the storage medium with the <b>IMDSPObject</b> interface return an error code. The <b>GetCapabilities</b> method can be called in order to determine whether an operation can be expected to succeed under normal circumstances.
     * 
     * If either the WMDM_STORAGECAP_FILELIMITEXISTS flag or the WMDM_STORAGECAP_FOLDERLIMITEXISTS flag is true, there are arbitrary limits on the number of files or folders that can be created. Operations through the <b>IMDSPObject</b> interface that exceed these limits will fail.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCapabilities
    }

    /**
     * The GetSerialNumber method retrieves a serial number uniquely identifying the storage medium. This method must be implemented for protected content transfer, but otherwise it is optional. For more information, see Mandatory and Optional Interfaces.
     * @remarks
     * Not all storage media support serial numbers. The return code must always be checked to determine whether the storage medium provides this support. If the storage medium does not support returning a unique serial number, protected content cannot be transferred to the medium. If the storage represented is removable media, the serial number returned must be the storage serial number, which should be distinct from the device serial number.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {WMDMID} Pointer to a <b>WMDMID</b> structure containing the serial number information. This parameter is included in the output message authentication code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-getserialnumber
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
     * The GetTotalSize method retrieves the total size, in bytes, of the medium associated with this IMDSPStorageGlobals interface.
     * @remarks
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<Integer>} pdwTotalSizeLow Pointer to a <b>DWORD</b> containing the low-order bytes of the total size of the medium.
     * @param {Pointer<Integer>} pdwTotalSizeHigh Pointer to a <b>DWORD</b> containing the high-order bytes of the total size of the medium.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-gettotalsize
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
     * The GetTotalFree method retrieves the total free space on the storage medium, in bytes.
     * @remarks
     * To determine the amount of storage space in use by the medium for file management, subtract the number of bad bytes identified by using <b>GetTotalBad</b> from the number of free bytes identified by using <b>GetTotalFree</b>.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<Integer>} pdwFreeLow Pointer to a <b>DWORD</b> containing the low-order bytes of the free space.
     * @param {Pointer<Integer>} pdwFreeHigh Pointer to a <b>DWORD</b> containing the high-order bytes of the free space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-gettotalfree
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
     * The GetTotalBad method retrieves the total amount of unusable space on the storage medium, in bytes. (IMDSPStorageGlobals.GetTotalBad)
     * @remarks
     * To determine the amount of storage space in use by the medium for file management, subtract the number of bad bytes identified by using <b>GetTotalBad</b> from the number of free bytes identified by using <b>GetTotalFree</b>.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<Integer>} pdwBadLow Pointer to a <b>DWORD</b> containing the low-order bytes of the unusable space.
     * @param {Pointer<Integer>} pdwBadHigh Pointer to a <b>DWORD</b> containing the high-order bytes of the unusable space.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-gettotalbad
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
     * The GetStatus method retrieves the current status of the storage medium.
     * @remarks
     * You must always call this method before attempting to interact with a storage medium. The status value returned is WMDM_STATUS_BUSY if some other interface has invoked an ongoing operation. You can evaluate the value returned from this call to determine whether an ongoing operation has been invoked from the <b>IMDSPStorageGlobals</b> interface.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "uint*", &pdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStatus
    }

    /**
     * The Initialize method formats the storage medium. (IMDSPStorageGlobals.Initialize)
     * @remarks
     * If WMDM_MODE_BLOCK is specified, <b>Initialize</b> does not return until formatting is finished. If the WMDM_MODE_THREAD is specified, the call returns immediately and the caller can use the <b>IMDSPStorageGlobals::GetStatus</b> method to track the initializing operation.
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-initialize
     */
    Initialize(fuMode, pProgress) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDevice method retrieves a pointer to the device on which the storage medium with which this interface is associated is mounted.
     * @remarks
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPDevice} Pointer to a device identified by the <b>IMDSPDevice</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-getdevice
     */
    GetDevice() {
        result := ComCall(10, this, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPDevice(ppDevice)
    }

    /**
     * The GetRootStorage method retrieves a pointer to the IMDSPStorage interface for the root storage of the storage medium.
     * @remarks
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPStorage} Pointer to an <b>IMDSPStorage</b> pointer that receives the root storage.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspstorageglobals-getrootstorage
     */
    GetRootStorage() {
        result := ComCall(11, this, "ptr*", &ppRoot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppRoot)
    }
}
