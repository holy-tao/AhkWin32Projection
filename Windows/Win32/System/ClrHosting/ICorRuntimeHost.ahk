#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICorRuntimeHost extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    CreateLogicalThreadState() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteLogicalThreadState() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFiberCookie 
     * @returns {HRESULT} 
     */
    SwitchInLogicalThreadState(pFiberCookie) {
        result := ComCall(5, this, "uint*", pFiberCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFiberCookie 
     * @returns {HRESULT} 
     */
    SwitchOutLogicalThreadState(pFiberCookie) {
        result := ComCall(6, this, "uint*", pFiberCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    LocksHeldByLogicalThread(pCount) {
        result := ComCall(7, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(8, this, "ptr", hFile, "ptr", hMapAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICorConfiguration>} pConfiguration 
     * @returns {HRESULT} 
     */
    GetConfiguration(pConfiguration) {
        result := ComCall(9, this, "ptr", pConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @param {Pointer<IUnknown>} pIdentityArray 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    CreateDomain(pwzFriendlyName, pIdentityArray, pAppDomain) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(12, this, "ptr", pwzFriendlyName, "ptr", pIdentityArray, "ptr", pAppDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    GetDefaultDomain(pAppDomain) {
        result := ComCall(13, this, "ptr", pAppDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {HRESULT} 
     */
    EnumDomains(hEnum) {
        result := ComCall(14, this, "ptr", hEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    NextDomain(hEnum, pAppDomain) {
        result := ComCall(15, this, "ptr", hEnum, "ptr", pAppDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {HRESULT} 
     */
    CloseEnum(hEnum) {
        result := ComCall(16, this, "ptr", hEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @param {Pointer<IUnknown>} pSetup 
     * @param {Pointer<IUnknown>} pEvidence 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    CreateDomainEx(pwzFriendlyName, pSetup, pEvidence, pAppDomain) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(17, this, "ptr", pwzFriendlyName, "ptr", pSetup, "ptr", pEvidence, "ptr", pAppDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomainSetup 
     * @returns {HRESULT} 
     */
    CreateDomainSetup(pAppDomainSetup) {
        result := ComCall(18, this, "ptr", pAppDomainSetup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pEvidence 
     * @returns {HRESULT} 
     */
    CreateEvidence(pEvidence) {
        result := ComCall(19, this, "ptr", pEvidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    UnloadDomain(pAppDomain) {
        result := ComCall(20, this, "ptr", pAppDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pAppDomain 
     * @returns {HRESULT} 
     */
    CurrentDomain(pAppDomain) {
        result := ComCall(21, this, "ptr", pAppDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
