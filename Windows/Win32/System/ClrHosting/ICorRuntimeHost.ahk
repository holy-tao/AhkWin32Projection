#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICorRuntimeHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorRuntimeHost
     * @type {Guid}
     */
    static IID => Guid("{cb2f6722-ab3a-11d2-9c40-00c04fa30a3e}")

    /**
     * The class identifier for CorRuntimeHost
     * @type {Guid}
     */
    static CLSID => Guid("{cb2f6723-ab3a-11d2-9c40-00c04fa30a3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLogicalThreadState", "DeleteLogicalThreadState", "SwitchInLogicalThreadState", "SwitchOutLogicalThreadState", "LocksHeldByLogicalThread", "MapFile", "GetConfiguration", "Start", "Stop", "CreateDomain", "GetDefaultDomain", "EnumDomains", "NextDomain", "CloseEnum", "CreateDomainEx", "CreateDomainSetup", "CreateEvidence", "UnloadDomain", "CurrentDomain"]

    /**
     * 
     * @returns {HRESULT} 
     */
    CreateLogicalThreadState() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteLogicalThreadState() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFiberCookie 
     * @returns {HRESULT} 
     */
    SwitchInLogicalThreadState(pFiberCookie) {
        pFiberCookieMarshal := pFiberCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pFiberCookieMarshal, pFiberCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pFiberCookie 
     * @returns {HRESULT} 
     */
    SwitchOutLogicalThreadState(pFiberCookie) {
        pFiberCookieMarshal := pFiberCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pFiberCookieMarshal, pFiberCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    LocksHeldByLogicalThread(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hFile 
     * @param {Pointer<HMODULE>} hMapAddress 
     * @returns {HRESULT} 
     */
    MapFile(hFile, hMapAddress) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        result := ComCall(8, this, "ptr", hFile, "ptr", hMapAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICorConfiguration>} pConfiguration 
     * @returns {HRESULT} 
     */
    GetConfiguration(pConfiguration) {
        result := ComCall(9, this, "ptr*", pConfiguration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @param {IUnknown} pIdentityArray 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    CreateDomain(pwzFriendlyName, pIdentityArray, pAppDomain) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(12, this, "ptr", pwzFriendlyName, "ptr", pIdentityArray, "ptr*", pAppDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    GetDefaultDomain(pAppDomain) {
        result := ComCall(13, this, "ptr*", pAppDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} hEnum 
     * @returns {HRESULT} 
     */
    EnumDomains(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, hEnumMarshal, hEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    NextDomain(hEnum, pAppDomain) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, hEnumMarshal, hEnum, "ptr*", pAppDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {HRESULT} 
     */
    CloseEnum(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, hEnumMarshal, hEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @param {IUnknown} pSetup 
     * @param {IUnknown} pEvidence 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    CreateDomainEx(pwzFriendlyName, pSetup, pEvidence, pAppDomain) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(17, this, "ptr", pwzFriendlyName, "ptr", pSetup, "ptr", pEvidence, "ptr*", pAppDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomainSetup 
     * @returns {HRESULT} 
     */
    CreateDomainSetup(pAppDomainSetup) {
        result := ComCall(18, this, "ptr*", pAppDomainSetup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pEvidence 
     * @returns {HRESULT} 
     */
    CreateEvidence(pEvidence) {
        result := ComCall(19, this, "ptr*", pEvidence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pAppDomain 
     * @returns {HRESULT} 
     */
    UnloadDomain(pAppDomain) {
        result := ComCall(20, this, "ptr", pAppDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    CurrentDomain(pAppDomain) {
        result := ComCall(21, this, "ptr*", pAppDomain, "HRESULT")
        return result
    }
}
