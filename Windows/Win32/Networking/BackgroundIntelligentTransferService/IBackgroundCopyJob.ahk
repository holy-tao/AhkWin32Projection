#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyJob interface to add files to the job, set the priority level of the job, determine the state of the job, and to start and stop the job.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopyjob
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob extends IUnknown{
    /**
     * The interface identifier for IBackgroundCopyJob
     * @type {Guid}
     */
    static IID => Guid("{37668d37-507e-4160-9316-26306d150b12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cFileCount 
     * @param {Pointer<BG_FILE_INFO>} pFileSet 
     * @returns {HRESULT} 
     */
    AddFileSet(cFileCount, pFileSet) {
        result := ComCall(3, this, "uint", cFileCount, "ptr", pFileSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteUrl 
     * @param {PWSTR} LocalName 
     * @returns {HRESULT} 
     */
    AddFile(RemoteUrl, LocalName) {
        RemoteUrl := RemoteUrl is String ? StrPtr(RemoteUrl) : RemoteUrl
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName

        result := ComCall(4, this, "ptr", RemoteUrl, "ptr", LocalName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBackgroundCopyFiles>} pEnum 
     * @returns {HRESULT} 
     */
    EnumFiles(pEnum) {
        result := ComCall(5, this, "ptr", pEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Suspend() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Complete() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pVal 
     * @returns {HRESULT} 
     */
    GetId(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    GetType(pVal) {
        result := ComCall(11, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BG_JOB_PROGRESS>} pVal 
     * @returns {HRESULT} 
     */
    GetProgress(pVal) {
        result := ComCall(12, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BG_JOB_TIMES>} pVal 
     * @returns {HRESULT} 
     */
    GetTimes(pVal) {
        result := ComCall(13, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    GetState(pVal) {
        result := ComCall(14, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBackgroundCopyError>} ppError 
     * @returns {HRESULT} 
     */
    GetError(ppError) {
        result := ComCall(15, this, "ptr", ppError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     */
    GetOwner(pVal) {
        result := ComCall(16, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Val 
     * @returns {HRESULT} 
     */
    SetDisplayName(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(17, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     */
    GetDisplayName(pVal) {
        result := ComCall(18, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Val 
     * @returns {HRESULT} 
     */
    SetDescription(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(19, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     */
    GetDescription(pVal) {
        result := ComCall(20, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Val 
     * @returns {HRESULT} 
     */
    SetPriority(Val) {
        result := ComCall(21, this, "int", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    GetPriority(pVal) {
        result := ComCall(22, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Val 
     * @returns {HRESULT} 
     */
    SetNotifyFlags(Val) {
        result := ComCall(23, this, "uint", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pVal 
     * @returns {HRESULT} 
     */
    GetNotifyFlags(pVal) {
        result := ComCall(24, this, "uint*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} Val 
     * @returns {HRESULT} 
     */
    SetNotifyInterface(Val) {
        result := ComCall(25, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     */
    GetNotifyInterface(pVal) {
        result := ComCall(26, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     */
    SetMinimumRetryDelay(Seconds) {
        result := ComCall(27, this, "uint", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Seconds 
     * @returns {HRESULT} 
     */
    GetMinimumRetryDelay(Seconds) {
        result := ComCall(28, this, "uint*", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     */
    SetNoProgressTimeout(Seconds) {
        result := ComCall(29, this, "uint", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Seconds 
     * @returns {HRESULT} 
     */
    GetNoProgressTimeout(Seconds) {
        result := ComCall(30, this, "uint*", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Errors 
     * @returns {HRESULT} 
     */
    GetErrorCount(Errors) {
        result := ComCall(31, this, "uint*", Errors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProxyUsage 
     * @param {PWSTR} ProxyList 
     * @param {PWSTR} ProxyBypassList 
     * @returns {HRESULT} 
     */
    SetProxySettings(ProxyUsage, ProxyList, ProxyBypassList) {
        ProxyList := ProxyList is String ? StrPtr(ProxyList) : ProxyList
        ProxyBypassList := ProxyBypassList is String ? StrPtr(ProxyBypassList) : ProxyBypassList

        result := ComCall(32, this, "int", ProxyUsage, "ptr", ProxyList, "ptr", ProxyBypassList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pProxyUsage 
     * @param {Pointer<PWSTR>} pProxyList 
     * @param {Pointer<PWSTR>} pProxyBypassList 
     * @returns {HRESULT} 
     */
    GetProxySettings(pProxyUsage, pProxyList, pProxyBypassList) {
        result := ComCall(33, this, "int*", pProxyUsage, "ptr", pProxyList, "ptr", pProxyBypassList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TakeOwnership() {
        result := ComCall(34, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
