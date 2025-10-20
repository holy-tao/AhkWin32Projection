#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class IDirectInputEffect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputEffect
     * @type {Guid}
     */
    static IID => Guid("{e7e1f7c0-88d2-11d0-9ad0-00a0c9a06e35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetEffectGuid", "GetParameters", "SetParameters", "Start", "Stop", "GetEffectStatus", "Download", "Unload", "Escape"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
     * @param {Pointer<Guid>} param2 
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
    Initialize(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(3, this, "ptr", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} 
     */
    GetEffectGuid(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECT>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    GetParameters(param0, param1) {
        result := ComCall(5, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECT>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetParameters(param0, param1) {
        result := ComCall(6, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Start(param0, param1) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetEffectStatus(param0) {
        result := ComCall(9, this, "uint*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Download() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @param {Pointer<DIEFFESCAPE>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     */
    Escape(param0) {
        result := ComCall(12, this, "ptr", param0, "HRESULT")
        return result
    }
}
