#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a device with backing in the registry and allows the caller to then make calls to Software Device API functions with the hSwDevice handle.
 * @remarks
 * The operating system calls the <b>SW_DEVICE_CREATE_CALLBACK</b> callback function after PnP enumerates the device.  After the callback function is called, the device has backing in the registry and calls to Software Device API functions can be made by using the <i>hSwDevice</i> handle.  You can also use other APIs that work with devices for the device that is created.  
 * 
 * PnP enumeration of a device is the first step that a device undergoes.  After PnP enumeration of the device, the device only has registry backing, and you can set properties against the device. Just because PnP enumerated the device, the device hasn't started yet, and no driver for the device has registered or enabled interfaces yet.  In many cases, we recommend that apps wait for device-interface arrival if they want to use the device.
 * 
 * 
 * <div class="alert"><b>Note</b>  The callback function supplies the device instance ID for the created device. We recommend that callers of the Software Device API not try to guess at or construct the device instance ID themselves; always use the value provided by the callback function.</div>
 * <div> </div>
 * The callback function will execute on an arbitrary thread-pool thread.  Client apps can perform as much work as needed in the callback function.
 * 
 * In Windows 8, you can't call <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swdeviceclose">SwDeviceClose</a> inside the callback function.  Doing so will cause a deadlock.  Be careful of releasing a ref counted object that will call <b>SwDeviceClose</b> when its destructor runs.  In Windows 8.1, this restriction is lifted, and you can call <b>SwDeviceClose</b> inside the callback function.
 * 
 * Always check the HRESULT that is passed to <i>CreateResult</i> to make sure PnP was able to enumerate the device.
 * @see https://learn.microsoft.com/windows/win32/api//content/swdevice/nc-swdevice-sw_device_create_callback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class SW_DEVICE_CREATE_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HSWDEVICE} hSwDevice_ 
     * @param {HRESULT} CreateResult 
     * @param {Pointer<Void>} pContext 
     * @param {PWSTR} pszDeviceInstanceId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSwDevice_, CreateResult, pContext, pszDeviceInstanceId) {
        hSwDevice_ := hSwDevice_ is Win32Handle ? NumGet(hSwDevice_, "ptr") : hSwDevice_
        pszDeviceInstanceId := pszDeviceInstanceId is String ? StrPtr(pszDeviceInstanceId) : pszDeviceInstanceId

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hSwDevice_, "int", CreateResult, pContextMarshal, pContext, "ptr", pszDeviceInstanceId)
    }
}
