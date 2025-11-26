#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The ILayoutStorage interface enables an application to optimize the layout of its compound files for efficient downloading across a slow link.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ilayoutstorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class ILayoutStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILayoutStorage
     * @type {Guid}
     */
    static IID => Guid("{0e6d4d90-6738-11cf-9608-00aa00680db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LayoutScript", "BeginMonitor", "EndMonitor", "ReLayoutDocfile", "ReLayoutDocfileOnILockBytes"]

    /**
     * The LayoutScript method provides explicit directions for reordering the storages, streams, and controls in a compound file to match the order in which they are accessed during the download.
     * @param {Pointer<StorageLayout>} pStorageLayout Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-storagelayout">StorageLayout</a> structures.
     * @param {Integer} nEntries Number of entries in the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-storagelayout">StorageLayout</a> structures.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, as well as the following:
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |STG_E_INVALIDPOINTER | The storage layout pointer is invalid.|
     * |STG_E_INVALIDFLAG | The value of *glfInterleavedFlag* is invalid.|
     * |STG_E_PATHNOTFOUND | The new document file name specified is invalid.|
     * |STG_E_INSUFFICIENTMEMORY | There is not enough memory to complete the operation.|
     * |STG_E_INVALIDPARAMETER | One of the parameters is invalid.|
     * | STG_E_INUSE | The **BeginMonitor** method was called while **ILayoutStorage** was already monitoring.|
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilayoutstorage-layoutscript
     */
    LayoutScript(pStorageLayout, nEntries) {
        static glfInterleavedFlag := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pStorageLayout, "uint", nEntries, "uint", glfInterleavedFlag, "HRESULT")
        return result
    }

    /**
     * The BeginMonitor method is used to begin monitoring when a loading operation is started. When the operation is complete, the application must call ILayoutStorage::EndMonitor.
     * @returns {HRESULT} This method supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, as well as the following:
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * | STG_E_INUSE | BeginMonitor</xref> was called while **ILayoutStorage** was already monitoring. |
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilayoutstorage-beginmonitor
     */
    BeginMonitor() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The EndMonitor method ends monitoring of a compound file. Must be preceded by a call to ILayoutStorage::BeginMonitor.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, as well as all return values for <a href="/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilayoutstorage-endmonitor
     */
    EndMonitor() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The ReLayoutDocfile method rewrites the compound file, using the layout script obtained through monitoring, or provided through explicit layout scripting, to create a new compound file.
     * @param {PWSTR} pwcsNewDfName Pointer to the name of the compound file to be rewritten. This name must be a valid filename, distinct from the name of the original compound file. The original compound file will be optimized and written to the new <i>pwcsNewDfName</i>.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, as well as the following:
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |STG_E_INVALIDNAME | The name passed to this function is not a valid file name.|
     * |STG_E_UNKNOWN | The layout information has been corrupted and cannot be processed.|
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilayoutstorage-relayoutdocfile
     */
    ReLayoutDocfile(pwcsNewDfName) {
        pwcsNewDfName := pwcsNewDfName is String ? StrPtr(pwcsNewDfName) : pwcsNewDfName

        result := ComCall(6, this, "ptr", pwcsNewDfName, "HRESULT")
        return result
    }

    /**
     * Is not implemented. If called, it returns STG_E_UNIMPLEMENTEDFUNCTION.
     * @param {ILockBytes} pILockBytes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface on the underlying byte-array object where the compound file is to be rewritten.
     * @returns {HRESULT} This method returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_UNIMPLEMENTEDFUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilayoutstorage-relayoutdocfileonilockbytes
     */
    ReLayoutDocfileOnILockBytes(pILockBytes) {
        result := ComCall(7, this, "ptr", pILockBytes, "HRESULT")
        return result
    }
}
