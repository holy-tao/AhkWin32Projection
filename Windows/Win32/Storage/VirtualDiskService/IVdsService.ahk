#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and interact with VDS.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsservice
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsService
     * @type {Guid}
     */
    static IID => Guid("{0818a8ef-9ba9-40d8-a6f9-e22833cc771e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsServiceReady", "WaitForServiceReady", "GetProperties", "QueryProviders", "QueryMaskedDisks", "QueryUnallocatedDisks", "GetObject", "QueryDriveLetters", "QueryFileSystemTypes", "Reenumerate", "Refresh", "CleanupObsoleteMountPoints", "Advise", "Unadvise", "Reboot", "SetFlags", "ClearFlags"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-isserviceready
     */
    IsServiceReady() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-waitforserviceready
     */
    WaitForServiceReady() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_SERVICE_PROP>} pServiceProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-getproperties
     */
    GetProperties(pServiceProp) {
        result := ComCall(5, this, "ptr", pServiceProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} masks 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-queryproviders
     */
    QueryProviders(masks, ppEnum) {
        result := ComCall(6, this, "uint", masks, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-querymaskeddisks
     */
    QueryMaskedDisks(ppEnum) {
        result := ComCall(7, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-queryunallocateddisks
     */
    QueryUnallocatedDisks(ppEnum) {
        result := ComCall(8, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Guid} ObjectId 
     * @param {Integer} type 
     * @param {Pointer<IUnknown>} ppObjectUnk 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ObjectId, type, ppObjectUnk) {
        result := ComCall(9, this, "ptr", ObjectId, "int", type, "ptr*", ppObjectUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wcFirstLetter 
     * @param {Integer} count 
     * @param {Pointer<VDS_DRIVE_LETTER_PROP>} pDriveLetterPropArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-querydriveletters
     */
    QueryDriveLetters(wcFirstLetter, count, pDriveLetterPropArray) {
        result := ComCall(10, this, "char", wcFirstLetter, "uint", count, "ptr", pDriveLetterPropArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_FILE_SYSTEM_TYPE_PROP>>} ppFileSystemTypeProps 
     * @param {Pointer<Integer>} plNumberOfFileSystems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-queryfilesystemtypes
     */
    QueryFileSystemTypes(ppFileSystemTypeProps, plNumberOfFileSystems) {
        ppFileSystemTypePropsMarshal := ppFileSystemTypeProps is VarRef ? "ptr*" : "ptr"
        plNumberOfFileSystemsMarshal := plNumberOfFileSystems is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, ppFileSystemTypePropsMarshal, ppFileSystemTypeProps, plNumberOfFileSystemsMarshal, plNumberOfFileSystems, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-reenumerate
     */
    Reenumerate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-cleanupobsoletemountpoints
     */
    CleanupObsoleteMountPoints() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVdsAdviseSink} pSink 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-advise
     */
    Advise(pSink, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", pSink, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(16, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-reboot
     */
    Reboot() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} ulFlags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(ulFlags) {
        result := ComCall(18, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(19, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
