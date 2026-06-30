#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DIDEVCAPS.ahk
#Include .\DIPROPHEADER.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\DIDEVICEINSTANCEA.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\DIDEVICEOBJECTDATA.ahk
#Include .\DIDEVICEOBJECTINSTANCEA.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\DIDATAFORMAT.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
class IDirectInputDeviceA extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputDeviceA
     * @type {Guid}
     */
    static IID => Guid("{5944e680-c92e-11cf-bfc7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "EnumObjects", "GetProperty", "SetProperty", "Acquire", "Unacquire", "GetDeviceState", "GetDeviceData", "SetDataFormat", "SetEventNotification", "SetCooperativeLevel", "GetObjectInfo", "GetDeviceInfo", "RunControlPanel", "Initialize"]

    /**
     * 
     * @param {Pointer<DIDEVCAPS>} param0 
     * @returns {HRESULT} 
     */
    GetCapabilities(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
     * @param {Pointer<LPDIENUMDEVICEOBJECTSCALLBACKA>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} If the function succeeds, the return value is the last value returned by the callback function. Its meaning is user-defined.
     * 
     * If the objects cannot be enumerated (for example, there are too many objects), the function returns zero without calling the callback function.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-enumobjects
     */
    EnumObjects(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", param0, param1Marshal, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIPROPHEADER>} param1 
     * @returns {HRESULT} If the function is successful, the return value is the handle to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(param0, param1) {
        result := ComCall(5, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIPROPHEADER>} param1 
     * @returns {HRESULT} 
     */
    SetProperty(param0, param1) {
        result := ComCall(6, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Acquire() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unacquire() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @returns {HRESULT} 
     */
    GetDeviceState(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIDEVICEOBJECTDATA>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    GetDeviceData(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDATAFORMAT>} param0 
     * @returns {HRESULT} 
     */
    SetDataFormat(param0) {
        result := ComCall(11, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {HRESULT} 
     */
    SetEventNotification(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(12, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(13, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEOBJECTINSTANCEA>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetObjectInfo(param0, param1, param2) {
        result := ComCall(14, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEINSTANCEA>} param0 
     * @returns {HRESULT} 
     */
    GetDeviceInfo(param0) {
        result := ComCall(15, this, "ptr", param0, "HRESULT")
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

        result := ComCall(16, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(17, this, "ptr", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }
}
