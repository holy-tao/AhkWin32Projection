#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssComponent.ahk

/**
 * Defines additional methods for examining and modifying information about components contained in a requester's Backup Components Document.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscomponentex
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssComponentEx extends IVssComponent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssComponentEx
     * @type {Guid}
     */
    static IID => Guid("{156c8b5e-f131-4bd7-9c97-d1923be7e1fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 41

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrepareForBackupFailureMsg", "SetPostSnapshotFailureMsg", "GetPrepareForBackupFailureMsg", "GetPostSnapshotFailureMsg", "GetAuthoritativeRestore", "GetRollForward", "GetRestoreName"]

    /**
     * 
     * @param {PWSTR} wszFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-setprepareforbackupfailuremsg
     */
    SetPrepareForBackupFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(41, this, "ptr", wszFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-setpostsnapshotfailuremsg
     */
    SetPostSnapshotFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(42, this, "ptr", wszFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-getprepareforbackupfailuremsg
     */
    GetPrepareForBackupFailureMsg(pbstrFailureMsg) {
        result := ComCall(43, this, "ptr", pbstrFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-getpostsnapshotfailuremsg
     */
    GetPostSnapshotFailureMsg(pbstrFailureMsg) {
        result := ComCall(44, this, "ptr", pbstrFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbAuth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-getauthoritativerestore
     */
    GetAuthoritativeRestore(pbAuth) {
        result := ComCall(45, this, "int*", pbAuth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRollType 
     * @param {Pointer<BSTR>} pbstrPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-getrollforward
     */
    GetRollForward(pRollType, pbstrPoint) {
        result := ComCall(46, this, "int*", pRollType, "ptr", pbstrPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex-getrestorename
     */
    GetRestoreName(pbstrName) {
        result := ComCall(47, this, "ptr", pbstrName, "HRESULT")
        return result
    }
}
