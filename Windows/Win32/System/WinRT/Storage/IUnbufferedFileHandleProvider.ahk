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
     * 
     * @param {Pointer<IUnbufferedFileHandleOplockCallback>} oplockBreakCallback 
     * @param {Pointer<UIntPtr>} fileHandle 
     * @returns {HRESULT} 
     */
    OpenUnbufferedFileHandle(oplockBreakCallback, fileHandle) {
        result := ComCall(3, this, "ptr", oplockBreakCallback, "ptr*", fileHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseUnbufferedFileHandle() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
