#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class IDirectInputA extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputA
     * @type {Guid}
     */
    static IID => Guid("{89521360-aa8a-11cf-bfc7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice", "EnumDevices", "GetDeviceStatus", "RunControlPanel", "Initialize"]

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<IDirectInputDeviceA>} param1 
     * @param {IUnknown} param2 
     * @returns {HRESULT} 
     */
    CreateDevice(param0, param1, param2) {
        result := ComCall(3, this, "ptr", param0, "ptr*", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<LPDIENUMDEVICESCALLBACKA>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    EnumDevices(param0, param1, param2, param3) {
        result := ComCall(4, this, "uint", param0, "ptr", param1, "ptr", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} 
     */
    GetDeviceStatus(param0) {
        result := ComCall(5, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    RunControlPanel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(6, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
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
    Initialize(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(7, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }
}
