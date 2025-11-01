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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFileSet", "AddFile", "EnumFiles", "Suspend", "Resume", "Cancel", "Complete", "GetId", "GetType", "GetProgress", "GetTimes", "GetState", "GetError", "GetOwner", "SetDisplayName", "GetDisplayName", "SetDescription", "GetDescription", "SetPriority", "GetPriority", "SetNotifyFlags", "GetNotifyFlags", "SetNotifyInterface", "GetNotifyInterface", "SetMinimumRetryDelay", "GetMinimumRetryDelay", "SetNoProgressTimeout", "GetNoProgressTimeout", "GetErrorCount", "SetProxySettings", "GetProxySettings", "TakeOwnership"]

    /**
     * 
     * @param {Integer} cFileCount 
     * @param {Pointer<BG_FILE_INFO>} pFileSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-addfileset
     */
    AddFileSet(cFileCount, pFileSet) {
        result := ComCall(3, this, "uint", cFileCount, "ptr", pFileSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteUrl 
     * @param {PWSTR} LocalName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-addfile
     */
    AddFile(RemoteUrl, LocalName) {
        RemoteUrl := RemoteUrl is String ? StrPtr(RemoteUrl) : RemoteUrl
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName

        result := ComCall(4, this, "ptr", RemoteUrl, "ptr", LocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBackgroundCopyFiles>} pEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-enumfiles
     */
    EnumFiles(pEnum) {
        result := ComCall(5, this, "ptr*", pEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-suspend
     */
    Suspend() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-resume
     */
    Resume() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-cancel
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-complete
     */
    Complete() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getid
     */
    GetId(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-gettype
     */
    GetType(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BG_JOB_PROGRESS>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getprogress
     */
    GetProgress(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BG_JOB_TIMES>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-gettimes
     */
    GetTimes(pVal) {
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getstate
     */
    GetState(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IBackgroundCopyError>} ppError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-geterror
     */
    GetError(ppError) {
        result := ComCall(15, this, "ptr*", ppError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getowner
     */
    GetOwner(pVal) {
        result := ComCall(16, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setdisplayname
     */
    SetDisplayName(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(17, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getdisplayname
     */
    GetDisplayName(pVal) {
        result := ComCall(18, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setdescription
     */
    SetDescription(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(19, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getdescription
     */
    GetDescription(pVal) {
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setpriority
     */
    SetPriority(Val) {
        result := ComCall(21, this, "int", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getpriority
     */
    GetPriority(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setnotifyflags
     */
    SetNotifyFlags(Val) {
        result := ComCall(23, this, "uint", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getnotifyflags
     */
    GetNotifyFlags(pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface
     */
    SetNotifyInterface(Val) {
        result := ComCall(25, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getnotifyinterface
     */
    GetNotifyInterface(pVal) {
        result := ComCall(26, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setminimumretrydelay
     */
    SetMinimumRetryDelay(Seconds) {
        result := ComCall(27, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getminimumretrydelay
     */
    GetMinimumRetryDelay(Seconds) {
        SecondsMarshal := Seconds is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, SecondsMarshal, Seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setnoprogresstimeout
     */
    SetNoProgressTimeout(Seconds) {
        result := ComCall(29, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getnoprogresstimeout
     */
    GetNoProgressTimeout(Seconds) {
        SecondsMarshal := Seconds is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, SecondsMarshal, Seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Errors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-geterrorcount
     */
    GetErrorCount(Errors) {
        ErrorsMarshal := Errors is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, ErrorsMarshal, Errors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProxyUsage 
     * @param {PWSTR} ProxyList 
     * @param {PWSTR} ProxyBypassList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setproxysettings
     */
    SetProxySettings(ProxyUsage, ProxyList, ProxyBypassList) {
        ProxyList := ProxyList is String ? StrPtr(ProxyList) : ProxyList
        ProxyBypassList := ProxyBypassList is String ? StrPtr(ProxyBypassList) : ProxyBypassList

        result := ComCall(32, this, "int", ProxyUsage, "ptr", ProxyList, "ptr", ProxyBypassList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pProxyUsage 
     * @param {Pointer<PWSTR>} pProxyList 
     * @param {Pointer<PWSTR>} pProxyBypassList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getproxysettings
     */
    GetProxySettings(pProxyUsage, pProxyList, pProxyBypassList) {
        pProxyUsageMarshal := pProxyUsage is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pProxyUsageMarshal, pProxyUsage, "ptr", pProxyList, "ptr", pProxyBypassList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-takeownership
     */
    TakeOwnership() {
        result := ComCall(34, this, "HRESULT")
        return result
    }
}
