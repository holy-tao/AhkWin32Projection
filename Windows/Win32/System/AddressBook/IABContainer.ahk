#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIContainer.ahk

/**
 * Do not use. This interface provides access to address book containers. Applications call the methods of the interface to perform name resolution and to create, copy, and delete recipients.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/nn-wabdefs-iabcontainer
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IABContainer extends IMAPIContainer{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulCreateFlags 
     * @param {Pointer<IMAPIProp>} lppMAPIPropEntry 
     * @returns {HRESULT} 
     */
    CreateEntry(cbEntryID, lpEntryID, ulCreateFlags, lppMAPIPropEntry) {
        result := ComCall(19, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulCreateFlags, "ptr", lppMAPIPropEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpEntries 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    CopyEntries(lpEntries, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(20, this, "ptr", lpEntries, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpEntries 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    DeleteEntries(lpEntries, ulFlags) {
        result := ComCall(21, this, "ptr", lpEntries, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Integer} ulFlags 
     * @param {Pointer<ADRLIST>} lpAdrList 
     * @param {Pointer<FlagList>} lpFlagList 
     * @returns {HRESULT} 
     */
    ResolveNames(lpPropTagArray, ulFlags, lpAdrList, lpFlagList) {
        result := ComCall(22, this, "ptr", lpPropTagArray, "uint", ulFlags, "ptr", lpAdrList, "ptr", lpFlagList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
