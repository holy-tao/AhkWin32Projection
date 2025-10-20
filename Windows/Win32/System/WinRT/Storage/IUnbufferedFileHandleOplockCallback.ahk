#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Defines a callback method that you want to run when the opportunistic lock for a handle that you get by calling the IUnbufferedFileHandleProvider::OpenUnbufferedFileHandle method is broken.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nn-windowsstoragecom-iunbufferedfilehandleoplockcallback
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class IUnbufferedFileHandleOplockCallback extends IUnknown{
    /**
     * The interface identifier for IUnbufferedFileHandleOplockCallback
     * @type {Guid}
     */
    static IID => Guid("{d1019a0e-6243-4329-8497-2e75894d7710}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBrokenCallback() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
