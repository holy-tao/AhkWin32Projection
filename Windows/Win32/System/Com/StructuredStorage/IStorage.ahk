#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IStorage interface supports the creation and management of structured storage objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-istorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorage
     * @type {Guid}
     */
    static IID => Guid("{0000000b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStream", "OpenStream", "CreateStorage", "OpenStorage", "CopyTo", "MoveElementTo", "Commit", "Revert", "EnumElements", "DestroyElement", "RenameElement", "SetElementTimes", "SetClass", "SetStateBits", "Stat"]

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} reserved1 
     * @param {Integer} reserved2 
     * @param {Pointer<IStream>} ppstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-createstream
     */
    CreateStream(pwcsName, grfMode, reserved1, reserved2, ppstm) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(3, this, "ptr", pwcsName, "uint", grfMode, "uint", reserved1, "uint", reserved2, "ptr*", ppstm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} reserved2 
     * @param {Pointer<IStream>} ppstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-openstream
     */
    OpenStream(pwcsName, grfMode, reserved2, ppstm) {
        static reserved1 := 0 ;Reserved parameters must always be NULL

        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(4, this, "ptr", pwcsName, "ptr", reserved1, "uint", grfMode, "uint", reserved2, "ptr*", ppstm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} reserved1 
     * @param {Integer} reserved2 
     * @param {Pointer<IStorage>} ppstg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-createstorage
     */
    CreateStorage(pwcsName, grfMode, reserved1, reserved2, ppstg) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(5, this, "ptr", pwcsName, "uint", grfMode, "uint", reserved1, "uint", reserved2, "ptr*", ppstg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {IStorage} pstgPriority 
     * @param {Integer} grfMode 
     * @param {Pointer<Pointer<Integer>>} snbExclude 
     * @param {Integer} reserved 
     * @param {Pointer<IStorage>} ppstg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-openstorage
     */
    OpenStorage(pwcsName, pstgPriority, grfMode, snbExclude, reserved, ppstg) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        snbExcludeMarshal := snbExclude is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pwcsName, "ptr", pstgPriority, "uint", grfMode, snbExcludeMarshal, snbExclude, "uint", reserved, "ptr*", ppstg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ciidExclude 
     * @param {Pointer<Guid>} rgiidExclude 
     * @param {Pointer<Pointer<Integer>>} snbExclude 
     * @param {IStorage} pstgDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-copyto
     */
    CopyTo(ciidExclude, rgiidExclude, snbExclude, pstgDest) {
        snbExcludeMarshal := snbExclude is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", ciidExclude, "ptr", rgiidExclude, snbExcludeMarshal, snbExclude, "ptr", pstgDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {IStorage} pstgDest 
     * @param {PWSTR} pwcsNewName 
     * @param {Integer} grfFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-moveelementto
     */
    MoveElementTo(pwcsName, pstgDest, pwcsNewName, grfFlags) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName
        pwcsNewName := pwcsNewName is String ? StrPtr(pwcsNewName) : pwcsNewName

        result := ComCall(8, this, "ptr", pwcsName, "ptr", pstgDest, "ptr", pwcsNewName, "uint", grfFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfCommitFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-revert
     */
    Revert() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATSTG>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-enumelements
     */
    EnumElements(ppenum) {
        static reserved1 := 0, reserved2 := 0, reserved3 := 0 ;Reserved parameters must always be NULL

        result := ComCall(11, this, "uint", reserved1, "ptr", reserved2, "uint", reserved3, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-destroyelement
     */
    DestroyElement(pwcsName) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(12, this, "ptr", pwcsName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsOldName 
     * @param {PWSTR} pwcsNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-renameelement
     */
    RenameElement(pwcsOldName, pwcsNewName) {
        pwcsOldName := pwcsOldName is String ? StrPtr(pwcsOldName) : pwcsOldName
        pwcsNewName := pwcsNewName is String ? StrPtr(pwcsNewName) : pwcsNewName

        result := ComCall(13, this, "ptr", pwcsOldName, "ptr", pwcsNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Pointer<FILETIME>} pctime 
     * @param {Pointer<FILETIME>} patime 
     * @param {Pointer<FILETIME>} pmtime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-setelementtimes
     */
    SetElementTimes(pwcsName, pctime, patime, pmtime) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(14, this, "ptr", pwcsName, "ptr", pctime, "ptr", patime, "ptr", pmtime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-setclass
     */
    SetClass(clsid) {
        result := ComCall(15, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfStateBits 
     * @param {Integer} grfMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-setstatebits
     */
    SetStateBits(grfStateBits, grfMask) {
        result := ComCall(16, this, "uint", grfStateBits, "uint", grfMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STATSTG>} pstatstg 
     * @param {Integer} grfStatFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istorage-stat
     */
    Stat(pstatstg, grfStatFlag) {
        result := ComCall(17, this, "ptr", pstatstg, "uint", grfStatFlag, "HRESULT")
        return result
    }
}
