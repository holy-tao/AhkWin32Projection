#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IStillImageW extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStillImageW
     * @type {Guid}
     */
    static IID => Guid("{641bd880-2dc8-11d0-90ea-00aa0060f86c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetDeviceList", "GetDeviceInfo", "CreateDevice", "GetDeviceValue", "SetDeviceValue", "GetSTILaunchInformation", "RegisterLaunchApplication", "UnregisterLaunchApplication", "EnableHwNotifications", "GetHwNotificationState", "RefreshDeviceBus", "LaunchApplicationForDevice", "SetupDeviceParameters", "WriteToErrorLog"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(hinst, dwVersion) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst

        result := ComCall(3, this, "ptr", hinst, "uint", dwVersion, "HRESULT")
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
     * @param {Pointer<Pointer<Void>>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetDeviceInfo(pwszDeviceName, ppBuffer) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pwszDeviceName, ppBufferMarshal, ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {Integer} dwMode 
     * @param {Pointer<IStiDevice>} pDevice 
     * @param {IUnknown} punkOuter 
     * @returns {HRESULT} 
     */
    CreateDevice(pwszDeviceName, dwMode, pDevice, punkOuter) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(6, this, "ptr", pwszDeviceName, "uint", dwMode, "ptr*", pDevice, "ptr", punkOuter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {PWSTR} pValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer} pData 
     * @param {Pointer<Integer>} cbData 
     * @returns {HRESULT} 
     */
    GetDeviceValue(pwszDeviceName, pValueName, pType, pData, cbData) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
        cbDataMarshal := cbData is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pwszDeviceName, "ptr", pValueName, pTypeMarshal, pType, "ptr", pData, cbDataMarshal, cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {PWSTR} pValueName 
     * @param {Integer} Type 
     * @param {Pointer} pData 
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
     * @param {Pointer<Integer>} pdwEventCode 
     * @param {PWSTR} pwszEventName 
     * @returns {HRESULT} 
     */
    GetSTILaunchInformation(pwszDeviceName, pdwEventCode, pwszEventName) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        pdwEventCodeMarshal := pdwEventCode is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pwszDeviceName, pdwEventCodeMarshal, pdwEventCode, "ptr", pwszEventName, "HRESULT")
        return result
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

        result := ComCall(12, this, "ptr", pwszDeviceName, "int", bNewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDeviceName 
     * @param {Pointer<BOOL>} pbCurrentState 
     * @returns {HRESULT} 
     */
    GetHwNotificationState(pwszDeviceName, pbCurrentState) {
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(13, this, "ptr", pwszDeviceName, "ptr", pbCurrentState, "HRESULT")
        return result
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

        result := ComCall(15, this, "ptr", pwszDeviceName, "ptr", pwszAppName, "ptr", pStiNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STI_DEVICE_INFORMATIONW>} param0 
     * @returns {HRESULT} 
     */
    SetupDeviceParameters(param0) {
        result := ComCall(16, this, "ptr", param0, "HRESULT")
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
}
