#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIAdviseSink extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cNotif 
     * @param {Pointer<NOTIFICATION>} lpNotifications 
     * @returns {Integer} 
     */
    OnNotify(cNotif, lpNotifications) {
        result := ComCall(3, this, "uint", cNotif, "ptr", lpNotifications, "uint")
        return result
    }
}
