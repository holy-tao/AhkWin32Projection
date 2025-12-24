#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to handles from a random-access byte stream that the StorageFile.OpenAsync method created.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nn-windowsstoragecom-iunbufferedfilehandleprovider
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class IUnbufferedFileHandleProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnbufferedFileHandleProvider
     * @type {Guid}
     */
    static IID => Guid("{a65c9109-42ab-4b94-a7b1-dd2e4e68515e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenUnbufferedFileHandle", "CloseUnbufferedFileHandle"]

    /**
     * Gets a handle from a random-access byte stream that the StorageFile.OpenAsync method created and registers a callback method that you want to run when the opportunistic lock for the handle is broken.
     * @param {IUnbufferedFileHandleOplockCallback} oplockBreakCallback An interface that contains the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleoplockcallback-onbrokencallback">IUnbufferedFileHandleOplockCallback::OnBrokenCallback</a> method that you want to run when the opportunistic lock for the handle is broken.
     * @returns {Pointer} The handle from the random-access byte stream.
     * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-openunbufferedfilehandle
     */
    OpenUnbufferedFileHandle(oplockBreakCallback) {
        result := ComCall(3, this, "ptr", oplockBreakCallback, "ptr*", &fileHandle := 0, "HRESULT")
        return fileHandle
    }

    /**
     * Closes the handle from a random-access byte stream that you created by calling IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-closeunbufferedfilehandle
     */
    CloseUnbufferedFileHandle() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
