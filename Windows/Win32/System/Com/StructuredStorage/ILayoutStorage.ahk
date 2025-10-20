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
     * 
     * @param {Pointer<StorageLayout>} pStorageLayout 
     * @param {Integer} nEntries 
     * @returns {HRESULT} 
     */
    LayoutScript(pStorageLayout, nEntries) {
        static glfInterleavedFlag := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pStorageLayout, "uint", nEntries, "uint", glfInterleavedFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginMonitor() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndMonitor() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsNewDfName 
     * @returns {HRESULT} 
     */
    ReLayoutDocfile(pwcsNewDfName) {
        pwcsNewDfName := pwcsNewDfName is String ? StrPtr(pwcsNewDfName) : pwcsNewDfName

        result := ComCall(6, this, "ptr", pwcsNewDfName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILockBytes>} pILockBytes 
     * @returns {HRESULT} 
     */
    ReLayoutDocfileOnILockBytes(pILockBytes) {
        result := ComCall(7, this, "ptr", pILockBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
