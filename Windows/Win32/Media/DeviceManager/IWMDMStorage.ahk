#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorageGlobals.ahk
#Include .\WMDMDATETIME.ahk
#Include .\IWMDMEnumStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An instance of the IWMDMStorage interface provides methods to examine and explore a storage (a generic name for a data or collection object, such as a file, folder, or playlist) on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a06-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The class identifier for WMDMStorage
     * @type {Guid}
     */
    static CLSID => Guid("{807b3ce0-357a-11d3-8471-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttributes", "GetStorageGlobals", "GetAttributes", "GetName", "GetDate", "GetSize", "GetRights", "EnumStorage", "SendOpaqueCommand"]

    /**
     * The SetAttributes method sets the attributes of the storage.
     * @param {Integer} dwAttributes <b>DWORD</b> specifying the attributes to be set. The following table lists the attributes that can be set by this parameter.
     * 
     * <table>
     * <tr>
     * <th>Attribute
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_AUDIO</td>
     * <td>This file contains audio data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_DATA</td>
     * <td>This file contains non-audio data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANPLAY</td>
     * <td>This audio file can be played by the device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANDELETE</td>
     * <td>This file can be deleted.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANMOVE</td>
     * <td>This file or folder can be moved around on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANRENAME</td>
     * <td>This file or folder can be renamed.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANREAD</td>
     * <td>This file can be read by the host computer.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_MUSIC</td>
     * <td>This audio file contains music.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_AUDIOBOOK</td>
     * <td>This is an audio book file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_HIDDEN</td>
     * <td>This file is hidden on the file system</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_SYSTEM</td>
     * <td>This is a system file</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_READONLY</td>
     * <td>This is a read-only file.</td>
     * </tr>
     * </table>
     * @param {Pointer<WAVEFORMATEX>} pFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure that specifies audio information about the object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-setattributes
     */
    SetAttributes(dwAttributes, pFormat) {
        result := ComCall(3, this, "uint", dwAttributes, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The GetStorageGlobals method retrieves the IWMDMStorageGlobals interface of the root storage of this storage.
     * @returns {IWMDMStorageGlobals} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface, which provides information about the device such as serial number, capabilities, and so on. The caller must release this interface when finished with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-getstorageglobals
     */
    GetStorageGlobals() {
        result := ComCall(4, this, "ptr*", &ppStorageGlobals := 0, "HRESULT")
        return IWMDMStorageGlobals(ppStorageGlobals)
    }

    /**
     * The GetAttributes method retrieves the attributes of the storage.
     * @param {Pointer<WAVEFORMATEX>} pFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure that specifies the object's audio attributes.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying one or more of the following attributes, combined with a bitwise <b>OR</b>.
     * 
     * <table>
     * <tr>
     * <th>Attribute
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_FILESYSTEM</td>
     * <td>This object is the top-level storage medium, for example, a storage card or some other type of on-board storage.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_REMOVABLE</td>
     * <td>The global storage medium is removable.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_NONREMOVABLE</td>
     * <td>The global storage medium is not removable.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_FOLDERS</td>
     * <td>The global storage medium supports folders and file hierarchy.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_HAS_FILES</td>
     * <td>This storage object contains at least one file as an immediate child.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_HAS_FOLDERS</td>
     * <td>This storage object contains at least one folder as an immediate child.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_CANEDITMETADATA</td>
     * <td>This storage can edit metadata.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_FILE</td>
     * <td>This is a file on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_FOLDER</td>
     * <td>This is a folder on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_LINK</td>
     * <td>This is a link that creates an association between multiple files.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_AUDIO</td>
     * <td>This file contains audio data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_DATA</td>
     * <td>This file contains non-audio data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANPLAY</td>
     * <td>This audio file can be played by the device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANDELETE</td>
     * <td>This file can be deleted.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANMOVE</td>
     * <td>This file or folder can be moved around on the storage medium.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANRENAME</td>
     * <td>This file or folder can be renamed.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_CANREAD</td>
     * <td>This file can be read by the host computer.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_MUSIC</td>
     * <td>This audio file contains music.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_AUDIOBOOK</td>
     * <td>This is an audio book file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_VIDEO</td>
     * <td>This file contains video data.</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_HIDDEN</td>
     * <td>This file is hidden on the file system</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_SYSTEM</td>
     * <td>This is a system file</td>
     * </tr>
     * <tr>
     * <td>WMDM_FILE_ATTR_READONLY</td>
     * <td>This is a read-only file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_ATTR_VIRTUAL</td>
     * <td>This storage is virtual and does not correspond to an actual storage on the file system of the device. (Folders created based on metadata are one example of virtual storage.)</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_IS_DEFAULT</td>
     * <td>This storage is the default location for putting new digital media on the device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STORAGE_CONTAINS_DEFAULT</td>
     * <td>This storage contains the default storage where new digital media should be placed.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-getattributes
     */
    GetAttributes(pFormat) {
        result := ComCall(5, this, "uint*", &pdwAttributes := 0, "ptr", pFormat, "HRESULT")
        return pdwAttributes
    }

    /**
     * The GetName method retrieves the display name of the storage.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string specifying the storage name. This is the display name of the object is the file name without path information. The caller allocates and releases this buffer.
     * @param {Integer} nMaxChars Integer specifying the maximum number of characters that can be copied to the name string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-getname
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetDate method retrieves the date when the storage was last modified.
     * @returns {WMDMDATETIME} Pointer to a <b>WMDMDATETIME</b> structure specifying the date on which the storage object (file or folder) was last modified.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-getdate
     */
    GetDate() {
        pDateTimeUTC := WMDMDATETIME()
        result := ComCall(7, this, "ptr", pDateTimeUTC, "HRESULT")
        return pDateTimeUTC
    }

    /**
     * The GetSize method retrieves the size of the storage, in bytes.
     * @param {Pointer<Integer>} pdwSizeLow Pointer to a <b>DWORD</b> specifying the low-order part of the storage object size, in bytes.
     * @param {Pointer<Integer>} pdwSizeHigh Pointer to a <b>DWORD</b> specifying the high-order part of the storage object size, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-getsize
     */
    GetSize(pdwSizeLow, pdwSizeHigh) {
        pdwSizeLowMarshal := pdwSizeLow is VarRef ? "uint*" : "ptr"
        pdwSizeHighMarshal := pdwSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwSizeLowMarshal, pdwSizeLow, pdwSizeHighMarshal, pdwSizeHigh, "HRESULT")
        return result
    }

    /**
     * The GetRights method retrieves rights information for a licensed storage.
     * @param {Pointer<Pointer<WMDMRIGHTS>>} ppRights Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmrights">WMDMRIGHTS</a> structures that contain the storage rights. This parameter is included in the message authentication code. Windows Media Device Manager allocates this memory, and the application must release it with <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnRightsCount Pointer to the number of <b>WMDMRIGHTS</b> structures in the <i>ppRights</i> array. This parameter is included in the message authentication code.
     * @param {Pointer<Integer>} abMac Array of bytes containing the message authentication code (MAC) for the parameter data of this method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-getrights
     */
    GetRights(ppRights, pnRightsCount, abMac) {
        ppRightsMarshal := ppRights is VarRef ? "ptr*" : "ptr"
        pnRightsCountMarshal := pnRightsCount is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, ppRightsMarshal, ppRights, pnRightsCountMarshal, pnRightsCount, abMacMarshal, abMac, "HRESULT")
        return result
    }

    /**
     * The EnumStorage method retrieves an IWMDMEnumStorage interface to enumerate the immediate child storages of the current storage.
     * @returns {IWMDMEnumStorage} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumstorage">IWMDMEnumStorage</a> interface. The caller must release this interface when done with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-enumstorage
     */
    EnumStorage() {
        result := ComCall(10, this, "ptr*", &pEnumStorage := 0, "HRESULT")
        return IWMDMEnumStorage(pEnumStorage)
    }

    /**
     * The SendOpaqueCommand method sends a command to the storage through Windows Media Device Manager, without processing it.
     * @param {Pointer<OPAQUECOMMAND>} pCommand Pointer to an <a href="https://docs.microsoft.com/windows/desktop/WMDM/opaquecommand">OPAQUECOMMAND</a> structure containing the command to execute. Data can be passed two ways—from the application to the device, and from the device back to the application when the call finishes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmstorage-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(11, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
