#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorConfiguration.ahk" { ICorConfiguration }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICorRuntimeHost extends IUnknown {
    /**
     * The interface identifier for ICorRuntimeHost
     * @type {Guid}
     */
    static IID := Guid("{cb2f6722-ab3a-11d2-9c40-00c04fa30a3e}")

    /**
     * The class identifier for CorRuntimeHost
     * @type {Guid}
     */
    static CLSID := Guid("{cb2f6723-ab3a-11d2-9c40-00c04fa30a3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorRuntimeHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateLogicalThreadState    : IntPtr
        DeleteLogicalThreadState    : IntPtr
        SwitchInLogicalThreadState  : IntPtr
        SwitchOutLogicalThreadState : IntPtr
        LocksHeldByLogicalThread    : IntPtr
        MapFile                     : IntPtr
        GetConfiguration            : IntPtr
        Start                       : IntPtr
        Stop                        : IntPtr
        CreateDomain                : IntPtr
        GetDefaultDomain            : IntPtr
        EnumDomains                 : IntPtr
        NextDomain                  : IntPtr
        CloseEnum                   : IntPtr
        CreateDomainEx              : IntPtr
        CreateDomainSetup           : IntPtr
        CreateEvidence              : IntPtr
        UnloadDomain                : IntPtr
        CurrentDomain               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorRuntimeHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        hMapAddress := HMODULE.Owned()
        result := ComCall(8, this, HANDLE, hFile, HMODULE.Ptr, hMapAddress, "HRESULT")
        return hMapAddress
    }

    /**
     * Read the active configuration of the collector.
     * @returns {ICorConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-getconfiguration
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
     * The CurrentDomain property retrieves the DVD domain that the MSWebDVD object is in.
     * @remarks
     * The possible values of the property are:
     * 
     * 
     * 
     * | Value | Description          |
     * |-------|----------------------|
     * | 1     | First play           |
     * | 2     | Video Manager Menu   |
     * | 3     | Video Title Set Menu |
     * | 4     | Title                |
     * | 5     | Stop                 |
     * 
     * 
     * 
     *  
     * 
     * Call this method to ensure that the DVD Navigator is in a valid domain for the method you are about to call. For example, before calling [**PlayTitle**](playtitle-method.md), check the `CurrentDomain` property to make sure that the DVD Navigator is not in the Stop or First Play domain.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/currentdomain-property
     */
    CurrentDomain() {
        result := ComCall(21, this, "ptr*", &pAppDomain := 0, "HRESULT")
        return IUnknown(pAppDomain)
    }

    Query(iid) {
        if (ICorRuntimeHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateLogicalThreadState := CallbackCreate(GetMethod(implObj, "CreateLogicalThreadState"), flags, 1)
        this.vtbl.DeleteLogicalThreadState := CallbackCreate(GetMethod(implObj, "DeleteLogicalThreadState"), flags, 1)
        this.vtbl.SwitchInLogicalThreadState := CallbackCreate(GetMethod(implObj, "SwitchInLogicalThreadState"), flags, 2)
        this.vtbl.SwitchOutLogicalThreadState := CallbackCreate(GetMethod(implObj, "SwitchOutLogicalThreadState"), flags, 2)
        this.vtbl.LocksHeldByLogicalThread := CallbackCreate(GetMethod(implObj, "LocksHeldByLogicalThread"), flags, 2)
        this.vtbl.MapFile := CallbackCreate(GetMethod(implObj, "MapFile"), flags, 3)
        this.vtbl.GetConfiguration := CallbackCreate(GetMethod(implObj, "GetConfiguration"), flags, 2)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.CreateDomain := CallbackCreate(GetMethod(implObj, "CreateDomain"), flags, 4)
        this.vtbl.GetDefaultDomain := CallbackCreate(GetMethod(implObj, "GetDefaultDomain"), flags, 2)
        this.vtbl.EnumDomains := CallbackCreate(GetMethod(implObj, "EnumDomains"), flags, 2)
        this.vtbl.NextDomain := CallbackCreate(GetMethod(implObj, "NextDomain"), flags, 3)
        this.vtbl.CloseEnum := CallbackCreate(GetMethod(implObj, "CloseEnum"), flags, 2)
        this.vtbl.CreateDomainEx := CallbackCreate(GetMethod(implObj, "CreateDomainEx"), flags, 5)
        this.vtbl.CreateDomainSetup := CallbackCreate(GetMethod(implObj, "CreateDomainSetup"), flags, 2)
        this.vtbl.CreateEvidence := CallbackCreate(GetMethod(implObj, "CreateEvidence"), flags, 2)
        this.vtbl.UnloadDomain := CallbackCreate(GetMethod(implObj, "UnloadDomain"), flags, 2)
        this.vtbl.CurrentDomain := CallbackCreate(GetMethod(implObj, "CurrentDomain"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateLogicalThreadState)
        CallbackFree(this.vtbl.DeleteLogicalThreadState)
        CallbackFree(this.vtbl.SwitchInLogicalThreadState)
        CallbackFree(this.vtbl.SwitchOutLogicalThreadState)
        CallbackFree(this.vtbl.LocksHeldByLogicalThread)
        CallbackFree(this.vtbl.MapFile)
        CallbackFree(this.vtbl.GetConfiguration)
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.CreateDomain)
        CallbackFree(this.vtbl.GetDefaultDomain)
        CallbackFree(this.vtbl.EnumDomains)
        CallbackFree(this.vtbl.NextDomain)
        CallbackFree(this.vtbl.CloseEnum)
        CallbackFree(this.vtbl.CreateDomainEx)
        CallbackFree(this.vtbl.CreateDomainSetup)
        CallbackFree(this.vtbl.CreateEvidence)
        CallbackFree(this.vtbl.UnloadDomain)
        CallbackFree(this.vtbl.CurrentDomain)
    }
}
