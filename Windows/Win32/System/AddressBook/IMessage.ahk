#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include .\IAttach.ahk
#Include .\IMAPIProp.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessageimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMessage extends IMAPIProp{

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
    static VTableNames => ["GetAttachmentTable", "OpenAttach", "CreateAttach", "DeleteAttach", "GetRecipientTable", "ModifyRecipients", "SubmitMessage", "SetReadFlag"]

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {IMAPITable} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-getattachmenttable
     */
    GetAttachmentTable(ulFlags) {
        result := ComCall(14, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * 
     * @param {Integer} ulAttachmentNum 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @returns {IAttach} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-openattach
     */
    OpenAttach(ulAttachmentNum, lpInterface, ulFlags) {
        result := ComCall(15, this, "uint", ulAttachmentNum, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppAttach := 0, "HRESULT")
        return IAttach(lppAttach)
    }

    /**
     * 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulAttachmentNum 
     * @param {Pointer<IAttach>} lppAttach 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-createattach
     */
    CreateAttach(lpInterface, ulFlags, lpulAttachmentNum, lppAttach) {
        lpulAttachmentNumMarshal := lpulAttachmentNum is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", lpInterface, "uint", ulFlags, lpulAttachmentNumMarshal, lpulAttachmentNum, "ptr*", lppAttach, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulAttachmentNum 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-deleteattach
     */
    DeleteAttach(ulAttachmentNum, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(17, this, "uint", ulAttachmentNum, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {IMAPITable} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-getrecipienttable
     */
    GetRecipientTable(ulFlags) {
        result := ComCall(18, this, "uint", ulFlags, "ptr*", &lppTable := 0, "HRESULT")
        return IMAPITable(lppTable)
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<ADRLIST>} lpMods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-modifyrecipients
     */
    ModifyRecipients(ulFlags, lpMods) {
        result := ComCall(19, this, "uint", ulFlags, "ptr", lpMods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-submitmessage
     */
    SubmitMessage(ulFlags) {
        result := ComCall(20, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imessage-setreadflag
     */
    SetReadFlag(ulFlags) {
        result := ComCall(21, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
