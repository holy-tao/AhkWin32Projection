#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIContainer.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolderimapicontainer
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIFolder extends IMAPIContainer{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMessage", "CopyMessages", "DeleteMessages", "CreateFolder", "CopyFolder", "DeleteFolder", "SetReadFlags", "GetMessageStatus", "SetMessageStatus", "SaveContentsSort", "EmptyFolder"]

    /**
     * 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMessage>} lppMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-createmessage
     */
    CreateMessage(lpInterface, ulFlags, lppMessage) {
        result := ComCall(19, this, "ptr", lpInterface, "uint", ulFlags, "ptr*", lppMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpMsgList 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestFolder 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-copymessages
     */
    CopyMessages(lpMsgList, lpInterface, lpDestFolder, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(20, this, "ptr", lpMsgList, "ptr", lpInterface, "ptr", lpDestFolder, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpMsgList 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-deletemessages
     */
    DeleteMessages(lpMsgList, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(21, this, "ptr", lpMsgList, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFolderType 
     * @param {Pointer<Integer>} lpszFolderName 
     * @param {Pointer<Integer>} lpszFolderComment 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPIFolder>} lppFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-createfolder
     */
    CreateFolder(ulFolderType, lpszFolderName, lpszFolderComment, lpInterface, ulFlags, lppFolder) {
        result := ComCall(22, this, "uint", ulFolderType, "char*", lpszFolderName, "char*", lpszFolderComment, "ptr", lpInterface, "uint", ulFlags, "ptr*", lppFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestFolder 
     * @param {Pointer<Integer>} lpszNewFolderName 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-copyfolder
     */
    CopyFolder(cbEntryID, lpEntryID, lpInterface, lpDestFolder, lpszNewFolderName, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(23, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "ptr", lpDestFolder, "char*", lpszNewFolderName, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-deletefolder
     */
    DeleteFolder(cbEntryID, lpEntryID, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(24, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpMsgList 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-setreadflags
     */
    SetReadFlags(lpMsgList, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(25, this, "ptr", lpMsgList, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulMessageStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-getmessagestatus
     */
    GetMessageStatus(cbEntryID, lpEntryID, ulFlags, lpulMessageStatus) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "uint*", lpulMessageStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulNewStatus 
     * @param {Integer} ulNewStatusMask 
     * @param {Pointer<Integer>} lpulOldStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-setmessagestatus
     */
    SetMessageStatus(cbEntryID, lpEntryID, ulNewStatus, ulNewStatusMask, lpulOldStatus) {
        result := ComCall(27, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulNewStatus, "uint", ulNewStatusMask, "uint*", lpulOldStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SSortOrderSet>} lpSortCriteria 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-savecontentssort
     */
    SaveContentsSort(lpSortCriteria, ulFlags) {
        result := ComCall(28, this, "ptr", lpSortCriteria, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-emptyfolder
     */
    EmptyFolder(ulUIParam, lpProgress, ulFlags) {
        result := ComCall(29, this, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }
}
