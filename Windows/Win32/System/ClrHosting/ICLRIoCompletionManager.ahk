#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRIoCompletionManager extends IUnknown{
    /**
     * The interface identifier for ICLRIoCompletionManager
     * @type {Guid}
     */
    static IID => Guid("{2d74ce86-b8d6-4c84-b3a7-9768933b3c12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwErrorCode 
     * @param {Integer} NumberOfBytesTransferred 
     * @param {Pointer<Void>} pvOverlapped 
     * @returns {HRESULT} 
     */
    OnComplete(dwErrorCode, NumberOfBytesTransferred, pvOverlapped) {
        result := ComCall(3, this, "uint", dwErrorCode, "uint", NumberOfBytesTransferred, "ptr", pvOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
