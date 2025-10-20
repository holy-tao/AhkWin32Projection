#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncNotifyRegistration.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintUnidiAsyncNotifyRegistration extends IPrintAsyncNotifyRegistration{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<IAsyncGetSendNotificationCookie>} param0 
     * @returns {HRESULT} 
     */
    AsyncGetNotification(param0) {
        result := ComCall(5, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
