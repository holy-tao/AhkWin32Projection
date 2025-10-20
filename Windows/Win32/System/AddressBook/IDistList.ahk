#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIContainer.ahk

/**
 * Do not use. This interface is used to provide access to distribution lists in modifiable address book containers. The interface provides methods to create, copy, and delete distribution lists, in addition to performing name resolution.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/nn-wabdefs-idistlist
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IDistList extends IMAPIContainer{

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
    static VTableNames => ["CreateEntry", "CopyEntries", "DeleteEntries", "ResolveNames"]

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Integer} ulCreateFlags 
     * @param {Pointer<IMAPIProp>} lppMAPIPropEntry 
     * @returns {HRESULT} 
     */
    CreateEntry(cbEntryID, lpEntryID, ulCreateFlags, lppMAPIPropEntry) {
        result := ComCall(19, this, "uint", cbEntryID, "ptr", lpEntryID, "uint", ulCreateFlags, "ptr*", lppMAPIPropEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpEntries 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    CopyEntries(lpEntries, ulUIParam, lpProgress, ulFlags) {
        result := ComCall(20, this, "ptr", lpEntries, "ptr", ulUIParam, "ptr", lpProgress, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SBinaryArray>} lpEntries 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    DeleteEntries(lpEntries, ulFlags) {
        result := ComCall(21, this, "ptr", lpEntries, "uint", ulFlags, "HRESULT")
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
        result := ComCall(22, this, "ptr", lpPropTagArray, "uint", ulFlags, "ptr", lpAdrList, "ptr", lpFlagList, "HRESULT")
        return result
    }
}
