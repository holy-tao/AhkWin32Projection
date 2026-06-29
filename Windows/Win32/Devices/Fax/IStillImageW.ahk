#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\STINOTIFY.ahk" { STINOTIFY }
#Import ".\STI_DEVICE_INFORMATIONW.ahk" { STI_DEVICE_INFORMATIONW }
#Import ".\IStiDevice.ahk" { IStiDevice }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IStillImageW extends IUnknown {
    /**
     * The interface identifier for IStillImageW
     * @type {Guid}
     */
    static IID := Guid("{641bd880-2dc8-11d0-90ea-00aa0060f86c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStillImageW interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        GetDeviceList               : IntPtr
        GetDeviceInfo               : IntPtr
        CreateDevice                : IntPtr
        GetDeviceValue              : IntPtr
        SetDeviceValue              : IntPtr
        GetSTILaunchInformation     : IntPtr
        RegisterLaunchApplication   : IntPtr
        UnregisterLaunchApplication : IntPtr
        EnableHwNotifications       : IntPtr
        GetHwNotificationState      : IntPtr
        RefreshDeviceBus            : IntPtr
        LaunchApplicationForDevice  : IntPtr
        SetupDeviceParameters       : IntPtr
        WriteToErrorLog             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStillImageW.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {HINSTANCE} hinst 
     * @param {Integer} dwVersion 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(hinst, dwVersion) {
        result := ComCall(3, this, HINSTANCE, hinst, "uint", dwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pdwItemsReturned 
     * @param {Pointer<Pointer<Void>>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetDeviceList(dwType, dwFlags, pdwItemsReturned, ppBuffer) {
        pdwItemsReturnedMarshal := pdwItemsReturned is VarRef ? "uint*" : "ptr"
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", dwType, "uint", dwFlags, pdwItemsReturnedMarshal, pdwItemsReturned, ppBufferMarshal, ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @returns {Pointer<Void>} 
     */
    GetDeviceInfo(pwszDeviceName) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(5, this, "ptr", pwszDeviceName, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {Integer} dwMode 
     * @param {IUnknown} punkOuter 
     * @returns {IStiDevice} 
     */
    CreateDevice(pwszDeviceName, dwMode, punkOuter) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(6, this, "ptr", pwszDeviceName, "uint", dwMode, "ptr*", &pDevice := 0, "ptr", punkOuter, "HRESULT")
        return IStiDevice(pDevice)
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {PWSTR} pValueName 
     * @param {Integer} pData 
     * @param {Pointer<Integer>} cbData 
     * @returns {Integer} 
     */
    GetDeviceValue(pwszDeviceName, pValueName, pData, cbData) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        cbDataMarshal := cbData is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pwszDeviceName, "ptr", pValueName, "uint*", &pType := 0, "ptr", pData, cbDataMarshal, cbData, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {PWSTR} pValueName 
     * @param {Integer} Type 
     * @param {Integer} pData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    SetDeviceValue(pwszDeviceName, pValueName, Type, pData, cbData) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        result := ComCall(8, this, "ptr", pwszDeviceName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {PWSTR} pwszEventName 
     * @returns {Integer} 
     */
    GetSTILaunchInformation(pwszDeviceName, pwszEventName) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        result := ComCall(9, this, "ptr", pwszDeviceName, "uint*", &pdwEventCode := 0, "ptr", pwszEventName, "HRESULT")
        return pdwEventCode
    }

    /**
     * 
     * @param {PWSTR} pwszAppName 
     * @param {PWSTR} pwszCommandLine 
     * @returns {HRESULT} 
     */
    RegisterLaunchApplication(pwszAppName, pwszCommandLine) {
        pwszAppName := pwszAppName is String ? StrPtr(pwszAppName) : pwszAppName
        pwszCommandLine := pwszCommandLine is String ? StrPtr(pwszCommandLine) : pwszCommandLine

        result := ComCall(10, this, "ptr", pwszAppName, "ptr", pwszCommandLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAppName 
     * @returns {HRESULT} 
     */
    UnregisterLaunchApplication(pwszAppName) {
        pwszAppName := pwszAppName is String ? StrPtr(pwszAppName) : pwszAppName

        result := ComCall(11, this, "ptr", pwszAppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {BOOL} bNewState 
     * @returns {HRESULT} 
     */
    EnableHwNotifications(pwszDeviceName, bNewState) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(12, this, "ptr", pwszDeviceName, BOOL, bNewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @returns {BOOL} 
     */
    GetHwNotificationState(pwszDeviceName) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(13, this, "ptr", pwszDeviceName, BOOL.Ptr, &pbCurrentState := 0, "HRESULT")
        return pbCurrentState
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @returns {HRESULT} 
     */
    RefreshDeviceBus(pwszDeviceName) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(14, this, "ptr", pwszDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {PWSTR} pwszAppName 
     * @param {Pointer<STINOTIFY>} pStiNotify 
     * @returns {HRESULT} 
     */
    LaunchApplicationForDevice(pwszDeviceName, pwszAppName, pStiNotify) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName
        pwszAppName := pwszAppName is String ? StrPtr(pwszAppName) : pwszAppName

        result := ComCall(15, this, "ptr", pwszDeviceName, "ptr", pwszAppName, STINOTIFY.Ptr, pStiNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STI_DEVICE_INFORMATIONW>} param0 
     * @returns {HRESULT} 
     */
    SetupDeviceParameters(param0) {
        result := ComCall(16, this, STI_DEVICE_INFORMATIONW.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMessageType 
     * @param {PWSTR} pszMessage 
     * @returns {HRESULT} 
     */
    WriteToErrorLog(dwMessageType, pszMessage) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(17, this, "uint", dwMessageType, "ptr", pszMessage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStillImageW.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetDeviceList := CallbackCreate(GetMethod(implObj, "GetDeviceList"), flags, 5)
        this.vtbl.GetDeviceInfo := CallbackCreate(GetMethod(implObj, "GetDeviceInfo"), flags, 3)
        this.vtbl.CreateDevice := CallbackCreate(GetMethod(implObj, "CreateDevice"), flags, 5)
        this.vtbl.GetDeviceValue := CallbackCreate(GetMethod(implObj, "GetDeviceValue"), flags, 6)
        this.vtbl.SetDeviceValue := CallbackCreate(GetMethod(implObj, "SetDeviceValue"), flags, 6)
        this.vtbl.GetSTILaunchInformation := CallbackCreate(GetMethod(implObj, "GetSTILaunchInformation"), flags, 4)
        this.vtbl.RegisterLaunchApplication := CallbackCreate(GetMethod(implObj, "RegisterLaunchApplication"), flags, 3)
        this.vtbl.UnregisterLaunchApplication := CallbackCreate(GetMethod(implObj, "UnregisterLaunchApplication"), flags, 2)
        this.vtbl.EnableHwNotifications := CallbackCreate(GetMethod(implObj, "EnableHwNotifications"), flags, 3)
        this.vtbl.GetHwNotificationState := CallbackCreate(GetMethod(implObj, "GetHwNotificationState"), flags, 3)
        this.vtbl.RefreshDeviceBus := CallbackCreate(GetMethod(implObj, "RefreshDeviceBus"), flags, 2)
        this.vtbl.LaunchApplicationForDevice := CallbackCreate(GetMethod(implObj, "LaunchApplicationForDevice"), flags, 4)
        this.vtbl.SetupDeviceParameters := CallbackCreate(GetMethod(implObj, "SetupDeviceParameters"), flags, 2)
        this.vtbl.WriteToErrorLog := CallbackCreate(GetMethod(implObj, "WriteToErrorLog"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetDeviceList)
        CallbackFree(this.vtbl.GetDeviceInfo)
        CallbackFree(this.vtbl.CreateDevice)
        CallbackFree(this.vtbl.GetDeviceValue)
        CallbackFree(this.vtbl.SetDeviceValue)
        CallbackFree(this.vtbl.GetSTILaunchInformation)
        CallbackFree(this.vtbl.RegisterLaunchApplication)
        CallbackFree(this.vtbl.UnregisterLaunchApplication)
        CallbackFree(this.vtbl.EnableHwNotifications)
        CallbackFree(this.vtbl.GetHwNotificationState)
        CallbackFree(this.vtbl.RefreshDeviceBus)
        CallbackFree(this.vtbl.LaunchApplicationForDevice)
        CallbackFree(this.vtbl.SetupDeviceParameters)
        CallbackFree(this.vtbl.WriteToErrorLog)
    }
}
