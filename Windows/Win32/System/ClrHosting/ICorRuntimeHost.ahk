#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include .\ICorConfiguration.ahk
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
     * @returns {Pointer<Integer>} 
     */
    SwitchOutLogicalThreadState() {
        result := ComCall(6, this, "ptr*", &pFiberCookie := 0, "HRESULT")
        return pFiberCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    LocksHeldByLogicalThread() {
        result := ComCall(7, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {HANDLE} hFile 
     * @returns {HMODULE} 
     */
    MapFile(hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        hMapAddress := HMODULE()
        result := ComCall(8, this, "ptr", hFile, "ptr", hMapAddress, "HRESULT")
        return hMapAddress
    }

    /**
     * 
     * @returns {ICorConfiguration} 
     */
    GetConfiguration() {
        result := ComCall(9, this, "ptr*", &pConfiguration := 0, "HRESULT")
        return ICorConfiguration(pConfiguration)
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
     * @returns {IUnknown} 
     */
    CreateDomain(pwzFriendlyName, pIdentityArray) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(12, this, "ptr", pwzFriendlyName, "ptr", pIdentityArray, "ptr*", &pAppDomain := 0, "HRESULT")
        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetDefaultDomain() {
        result := ComCall(13, this, "ptr*", &pAppDomain := 0, "HRESULT")
        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    EnumDomains() {
        result := ComCall(14, this, "ptr*", &hEnum := 0, "HRESULT")
        return hEnum
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {IUnknown} 
     */
    NextDomain(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, hEnumMarshal, hEnum, "ptr*", &pAppDomain := 0, "HRESULT")
        return IUnknown(pAppDomain)
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
     * @returns {IUnknown} 
     */
    CreateDomainEx(pwzFriendlyName, pSetup, pEvidence) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(17, this, "ptr", pwzFriendlyName, "ptr", pSetup, "ptr", pEvidence, "ptr*", &pAppDomain := 0, "HRESULT")
        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    CreateDomainSetup() {
        result := ComCall(18, this, "ptr*", &pAppDomainSetup := 0, "HRESULT")
        return IUnknown(pAppDomainSetup)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    CreateEvidence() {
        result := ComCall(19, this, "ptr*", &pEvidence := 0, "HRESULT")
        return IUnknown(pEvidence)
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
     * @returns {IUnknown} 
     */
    CurrentDomain() {
        result := ComCall(21, this, "ptr*", &pAppDomain := 0, "HRESULT")
        return IUnknown(pAppDomain)
    }
}
