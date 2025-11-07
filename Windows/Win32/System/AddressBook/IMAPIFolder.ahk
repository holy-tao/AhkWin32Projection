#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMessage.ahk
#Include .\IMAPIFolder.ahk
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
     * @returns {IMessage} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-createmessage
     */
    CreateMessage(lpInterface, ulFlags) {
        result := ComCall(19, this, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppMessage := 0, "HRESULT")
        return IMessage(lppMessage)
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
        lpDestFolderMarshal := lpDestFolder is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, "ptr", lpMsgList, "ptr", lpInterface, lpDestFolderMarshal, lpDestFolder, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
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
     * @returns {IMAPIFolder} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-createfolder
     */
    CreateFolder(ulFolderType, lpszFolderName, lpszFolderComment, lpInterface, ulFlags) {
        lpszFolderNameMarshal := lpszFolderName is VarRef ? "char*" : "ptr"
        lpszFolderCommentMarshal := lpszFolderComment is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, "uint", ulFolderType, lpszFolderNameMarshal, lpszFolderName, lpszFolderCommentMarshal, lpszFolderComment, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppFolder := 0, "HRESULT")
        return IMAPIFolder(lppFolder)
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
        lpDestFolderMarshal := lpDestFolder is VarRef ? "ptr" : "ptr"
        lpszNewFolderNameMarshal := lpszNewFolderName is VarRef ? "char*" : "ptr"

        result := ComCall(23, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, lpDestFolderMarshal, lpDestFolder, lpszNewFolderNameMarshal, lpszNewFolderName, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-getmessagestatus
     */
    GetMessageStatus(cbEntryID, lpEntryID, ulFlags) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "uint*", &lpulMessageStatus := 0, "HRESULT")
        return lpulMessageStatus
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulNewStatus 
     * @param {Integer} ulNewStatusMask 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapifolder-setmessagestatus
     */
    SetMessageStatus(cbEntryID, lpEntryID, ulNewStatus, ulNewStatusMask) {
        result := ComCall(27, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulNewStatus, "uint", ulNewStatusMask, "uint*", &lpulOldStatus := 0, "HRESULT")
        return lpulOldStatus
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
