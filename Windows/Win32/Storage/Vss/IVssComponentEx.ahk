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
     * 
     * @param {PWSTR} wszFailureMsg 
     * @returns {HRESULT} 
     */
    SetPrepareForBackupFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(41, this, "ptr", wszFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszFailureMsg 
     * @returns {HRESULT} 
     */
    SetPostSnapshotFailureMsg(wszFailureMsg) {
        wszFailureMsg := wszFailureMsg is String ? StrPtr(wszFailureMsg) : wszFailureMsg

        result := ComCall(42, this, "ptr", wszFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFailureMsg 
     * @returns {HRESULT} 
     */
    GetPrepareForBackupFailureMsg(pbstrFailureMsg) {
        result := ComCall(43, this, "ptr", pbstrFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFailureMsg 
     * @returns {HRESULT} 
     */
    GetPostSnapshotFailureMsg(pbstrFailureMsg) {
        result := ComCall(44, this, "ptr", pbstrFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbAuth 
     * @returns {HRESULT} 
     */
    GetAuthoritativeRestore(pbAuth) {
        result := ComCall(45, this, "int*", pbAuth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRollType 
     * @param {Pointer<BSTR>} pbstrPoint 
     * @returns {HRESULT} 
     */
    GetRollForward(pRollType, pbstrPoint) {
        result := ComCall(46, this, "int*", pRollType, "ptr", pbstrPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetRestoreName(pbstrName) {
        result := ComCall(47, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
