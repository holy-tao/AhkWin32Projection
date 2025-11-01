#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncNotifyRegistration.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintBidiAsyncNotifyRegistration extends IPrintAsyncNotifyRegistration{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AsyncGetNewChannel"]

    /**
     * 
     * @param {IPrintAsyncNewChannelCookie} param0 
     * @returns {HRESULT} 
     */
    AsyncGetNewChannel(param0) {
        result := ComCall(5, this, "ptr", param0, "HRESULT")
        return result
    }
}
