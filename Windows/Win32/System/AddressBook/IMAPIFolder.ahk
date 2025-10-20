#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIContainer.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIFolder extends IMAPIContainer{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMessage>} lppMessage 
     * @returns {HRESULT} 
     */
    CreateMessage(lpInterface, ulFlags, lppMessage) {
        result := ComCall(19, this, "ptr", lpInterface, "uint", ulFlags, "ptr", lppMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpMsgList 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestFolder 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    CopyMessages(lpMsgList, lpInterface, lpDestFolder, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(20, this, "ptr", lpMsgList, "ptr", lpInterface, "ptr", lpDestFolder, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpMsgList 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    DeleteMessages(lpMsgList, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(21, this, "ptr", lpMsgList, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFolderType 
     * @param {Pointer<SByte>} lpszFolderName 
     * @param {Pointer<SByte>} lpszFolderComment 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPIFolder>} lppFolder 
     * @returns {HRESULT} 
     */
    CreateFolder(ulFolderType, lpszFolderName, lpszFolderComment, lpInterface, ulFlags, lppFolder) {
        result := ComCall(22, this, "uint", ulFolderType, "char*", lpszFolderName, "char*", lpszFolderComment, "ptr", lpInterface, "uint", ulFlags, "ptr", lppFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestFolder 
     * @param {Pointer<SByte>} lpszNewFolderName 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    CopyFolder(cbEntryID, lpEntryID, lpInterface, lpDestFolder, lpszNewFolderName, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(23, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "ptr", lpDestFolder, "char*", lpszNewFolderName, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    DeleteFolder(cbEntryID, lpEntryID, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(24, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpMsgList 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SetReadFlags(lpMsgList, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(25, this, "ptr", lpMsgList, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulMessageStatus 
     * @returns {HRESULT} 
     */
    GetMessageStatus(cbEntryID, lpEntryID, ulFlags, lpulMessageStatus) {
        result := ComCall(26, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulFlags, "uint*", lpulMessageStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulNewStatus 
     * @param {Integer} ulNewStatusMask 
     * @param {Pointer<UInt32>} lpulOldStatus 
     * @returns {HRESULT} 
     */
    SetMessageStatus(cbEntryID, lpEntryID, ulNewStatus, ulNewStatusMask, lpulOldStatus) {
        result := ComCall(27, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulNewStatus, "uint", ulNewStatusMask, "uint*", lpulOldStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SSortOrderSet>} lpSortCriteria 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SaveContentsSort(lpSortCriteria, ulFlags) {
        result := ComCall(28, this, "ptr", lpSortCriteria, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    EmptyFolder(ulUIParam, lpProgress, ulFlags) {
        result := ComCall(29, this, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
