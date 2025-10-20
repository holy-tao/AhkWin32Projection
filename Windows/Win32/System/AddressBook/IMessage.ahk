#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMessage extends IMAPIProp{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     */
    GetAttachmentTable(ulFlags, lppTable) {
        result := ComCall(14, this, "uint", ulFlags, "ptr", lppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAttachmentNum 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<IAttach>} lppAttach 
     * @returns {HRESULT} 
     */
    OpenAttach(ulAttachmentNum, lpInterface, ulFlags, lppAttach) {
        result := ComCall(15, this, "uint", ulAttachmentNum, "ptr", lpInterface, "uint", ulFlags, "ptr", lppAttach, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulAttachmentNum 
     * @param {Pointer<IAttach>} lppAttach 
     * @returns {HRESULT} 
     */
    CreateAttach(lpInterface, ulFlags, lpulAttachmentNum, lppAttach) {
        result := ComCall(16, this, "ptr", lpInterface, "uint", ulFlags, "uint*", lpulAttachmentNum, "ptr", lppAttach, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAttachmentNum 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    DeleteAttach(ulAttachmentNum, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(17, this, "uint", ulAttachmentNum, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     */
    GetRecipientTable(ulFlags, lppTable) {
        result := ComCall(18, this, "uint", ulFlags, "ptr", lppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<ADRLIST>} lpMods 
     * @returns {HRESULT} 
     */
    ModifyRecipients(ulFlags, lpMods) {
        result := ComCall(19, this, "uint", ulFlags, "ptr", lpMods, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SubmitMessage(ulFlags) {
        result := ComCall(20, this, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SetReadFlag(ulFlags) {
        result := ComCall(21, this, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
