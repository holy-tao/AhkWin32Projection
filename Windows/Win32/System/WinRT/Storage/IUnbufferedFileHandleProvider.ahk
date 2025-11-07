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
     * 
     * @param {IUnbufferedFileHandleOplockCallback} oplockBreakCallback 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-openunbufferedfilehandle
     */
    OpenUnbufferedFileHandle(oplockBreakCallback) {
        result := ComCall(3, this, "ptr", oplockBreakCallback, "ptr*", &fileHandle := 0, "HRESULT")
        return fileHandle
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-iunbufferedfilehandleprovider-closeunbufferedfilehandle
     */
    CloseUnbufferedFileHandle() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
