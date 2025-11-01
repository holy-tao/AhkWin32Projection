#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapistatusimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIStatus extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateState", "SettingsDialog", "ChangePassword", "FlushQueues"]

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapistatus-validatestate
     */
    ValidateState(ulUIParam, ulFlags) {
        result := ComCall(14, this, "ptr", ulUIParam, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapistatus-settingsdialog
     */
    SettingsDialog(ulUIParam, ulFlags) {
        result := ComCall(15, this, "ptr", ulUIParam, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpOldPass 
     * @param {Pointer<Integer>} lpNewPass 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapistatus-changepassword
     */
    ChangePassword(lpOldPass, lpNewPass, ulFlags) {
        result := ComCall(16, this, "char*", lpOldPass, "char*", lpNewPass, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} cbTargetTransport 
     * @param {Pointer<ENTRYID>} lpTargetTransport 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapistatus-flushqueues
     */
    FlushQueues(ulUIParam, cbTargetTransport, lpTargetTransport, ulFlags) {
        result := ComCall(17, this, "ptr", ulUIParam, "uint", cbTargetTransport, "ptr", lpTargetTransport, "uint", ulFlags, "HRESULT")
        return result
    }
}
