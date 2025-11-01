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
     * 
     * @param {Pointer<StorageLayout>} pStorageLayout 
     * @param {Integer} nEntries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilayoutstorage-layoutscript
     */
    LayoutScript(pStorageLayout, nEntries) {
        static glfInterleavedFlag := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pStorageLayout, "uint", nEntries, "uint", glfInterleavedFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilayoutstorage-beginmonitor
     */
    BeginMonitor() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilayoutstorage-endmonitor
     */
    EndMonitor() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsNewDfName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilayoutstorage-relayoutdocfile
     */
    ReLayoutDocfile(pwcsNewDfName) {
        pwcsNewDfName := pwcsNewDfName is String ? StrPtr(pwcsNewDfName) : pwcsNewDfName

        result := ComCall(6, this, "ptr", pwcsNewDfName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ILockBytes} pILockBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilayoutstorage-relayoutdocfileonilockbytes
     */
    ReLayoutDocfileOnILockBytes(pILockBytes) {
        result := ComCall(7, this, "ptr", pILockBytes, "HRESULT")
        return result
    }
}
