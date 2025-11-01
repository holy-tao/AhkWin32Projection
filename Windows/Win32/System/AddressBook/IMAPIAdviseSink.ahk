#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiadvisesinkiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIAdviseSink extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNotify"]

    /**
     * 
     * @param {Integer} cNotif 
     * @param {Pointer<NOTIFICATION>} lpNotifications 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiadvisesink-onnotify
     */
    OnNotify(cNotif, lpNotifications) {
        result := ComCall(3, this, "uint", cNotif, "ptr", lpNotifications, "uint")
        return result
    }
}
