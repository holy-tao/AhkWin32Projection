#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectInputEffect.ahk" { IDirectInputEffect }
#Import ".\DIDEVICEINSTANCEA.ahk" { DIDEVICEINSTANCEA }
#Import ".\DIACTIONFORMATA.ahk" { DIACTIONFORMATA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DIPROPHEADER.ahk" { DIPROPHEADER }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DIEFFECTINFOA.ahk" { DIEFFECTINFOA }
#Import ".\DIDATAFORMAT.ahk" { DIDATAFORMAT }
#Import ".\DIEFFESCAPE.ahk" { DIEFFESCAPE }
#Import ".\DIDEVICEOBJECTDATA.ahk" { DIDEVICEOBJECTDATA }
#Import ".\DIDEVICEOBJECTINSTANCEA.ahk" { DIDEVICEOBJECTINSTANCEA }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\DIFILEEFFECT.ahk" { DIFILEEFFECT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DIDEVCAPS.ahk" { DIDEVCAPS }
#Import ".\DIEFFECT.ahk" { DIEFFECT }
#Import ".\DIDEVICEIMAGEINFOHEADERA.ahk" { DIDEVICEIMAGEINFOHEADERA }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct IDirectInputDevice8A extends IUnknown {
    /**
     * The interface identifier for IDirectInputDevice8A
     * @type {Guid}
     */
    static IID := Guid("{54d41080-dc15-4833-a41b-748f73a38179}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputDevice8A interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCapabilities          : IntPtr
        EnumObjects              : IntPtr
        GetProperty              : IntPtr
        SetProperty              : IntPtr
        Acquire                  : IntPtr
        Unacquire                : IntPtr
        GetDeviceState           : IntPtr
        GetDeviceData            : IntPtr
        SetDataFormat            : IntPtr
        SetEventNotification     : IntPtr
        SetCooperativeLevel      : IntPtr
        GetObjectInfo            : IntPtr
        GetDeviceInfo            : IntPtr
        RunControlPanel          : IntPtr
        Initialize               : IntPtr
        CreateEffect             : IntPtr
        EnumEffects              : IntPtr
        GetEffectInfo            : IntPtr
        GetForceFeedbackState    : IntPtr
        SendForceFeedbackCommand : IntPtr
        EnumCreatedEffectObjects : IntPtr
        Escape                   : IntPtr
        Poll                     : IntPtr
        SendDeviceData           : IntPtr
        EnumEffectsInFile        : IntPtr
        WriteEffectToFile        : IntPtr
        BuildActionMap           : IntPtr
        SetActionMap             : IntPtr
        GetImageInfo             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputDevice8A.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DIDEVCAPS>} param0 
     * @returns {HRESULT} 
     */
    GetCapabilities(param0) {
        result := ComCall(3, this, DIDEVCAPS.Ptr, param0, "HRESULT")
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
        result := ComCall(5, this, Guid.Ptr, param0, DIPROPHEADER.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIPROPHEADER>} param1 
     * @returns {HRESULT} 
     */
    SetProperty(param0, param1) {
        result := ComCall(6, this, Guid.Ptr, param0, DIPROPHEADER.Ptr, param1, "HRESULT")
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

        result := ComCall(10, this, "uint", param0, DIDEVICEOBJECTDATA.Ptr, param1, param2Marshal, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDATAFORMAT>} param0 
     * @returns {HRESULT} 
     */
    SetDataFormat(param0) {
        result := ComCall(11, this, DIDATAFORMAT.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {HRESULT} 
     */
    SetEventNotification(param0) {
        result := ComCall(12, this, HANDLE, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(param0, param1) {
        result := ComCall(13, this, HWND, param0, "uint", param1, "HRESULT")
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
        result := ComCall(14, this, DIDEVICEOBJECTINSTANCEA.Ptr, param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEINSTANCEA>} param0 
     * @returns {HRESULT} 
     */
    GetDeviceInfo(param0) {
        result := ComCall(15, this, DIDEVICEINSTANCEA.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    RunControlPanel(param0, param1) {
        result := ComCall(16, this, HWND, param0, "uint", param1, "HRESULT")
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
        result := ComCall(17, this, HINSTANCE, param0, "uint", param1, Guid.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIEFFECT>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectInputEffect} 
     */
    CreateEffect(param0, param1, param3) {
        result := ComCall(18, this, Guid.Ptr, param0, DIEFFECT.Ptr, param1, "ptr*", &param2 := 0, "ptr", param3, "HRESULT")
        return IDirectInputEffect(param2)
    }

    /**
     * 
     * @param {Pointer<LPDIENUMEFFECTSCALLBACKA>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    EnumEffects(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, "ptr", param0, param1Marshal, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECTINFOA>} param0 
     * @param {Pointer<Guid>} param1 
     * @returns {HRESULT} 
     */
    GetEffectInfo(param0, param1) {
        result := ComCall(20, this, DIEFFECTINFOA.Ptr, param0, Guid.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetForceFeedbackState(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    SendForceFeedbackCommand(param0) {
        result := ComCall(22, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPDIENUMCREATEDEFFECTOBJECTSCALLBACK>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    EnumCreatedEffectObjects(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(23, this, "ptr", param0, param1Marshal, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The effect of passing 0 for <i>cbInput</i> will depend on the value of <i>nEscape</i> and on the driver that is handling the escape.
     * 
     * Of the original printer escapes, only the following can be used.
     * 
     * <table>
     * <tr>
     * <th>Escape</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * QUERYESCSUPPORT
     * 
     * </td>
     * <td>
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PASSTHROUGH
     * 
     * </td>
     * <td>
     * Allows the application to send data directly to a printer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For information about printer escapes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> function to prepare the printer driver to receive data.
     * @param {Pointer<DIEFFESCAPE>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-escape
     */
    Escape(param0) {
        result := ComCall(24, this, DIEFFESCAPE.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Poll() {
        result := ComCall(25, this, "HRESULT")
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
    SendDeviceData(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", param0, DIDEVICEOBJECTDATA.Ptr, param1, param2Marshal, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Pointer<LPDIENUMEFFECTSINFILECALLBACK>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    EnumEffectsInFile(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(27, this, "ptr", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<DIFILEEFFECT>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    WriteEffectToFile(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(28, this, "ptr", param0, "uint", param1, DIFILEEFFECT.Ptr, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIACTIONFORMATA>} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    BuildActionMap(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := ComCall(29, this, DIACTIONFORMATA.Ptr, param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIACTIONFORMATA>} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    SetActionMap(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := ComCall(30, this, DIACTIONFORMATA.Ptr, param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDEVICEIMAGEINFOHEADERA>} param0 
     * @returns {HRESULT} 
     */
    GetImageInfo(param0) {
        result := ComCall(31, this, DIDEVICEIMAGEINFOHEADERA.Ptr, param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputDevice8A.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCapabilities := CallbackCreate(GetMethod(implObj, "GetCapabilities"), flags, 2)
        this.vtbl.EnumObjects := CallbackCreate(GetMethod(implObj, "EnumObjects"), flags, 4)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.Acquire := CallbackCreate(GetMethod(implObj, "Acquire"), flags, 1)
        this.vtbl.Unacquire := CallbackCreate(GetMethod(implObj, "Unacquire"), flags, 1)
        this.vtbl.GetDeviceState := CallbackCreate(GetMethod(implObj, "GetDeviceState"), flags, 3)
        this.vtbl.GetDeviceData := CallbackCreate(GetMethod(implObj, "GetDeviceData"), flags, 5)
        this.vtbl.SetDataFormat := CallbackCreate(GetMethod(implObj, "SetDataFormat"), flags, 2)
        this.vtbl.SetEventNotification := CallbackCreate(GetMethod(implObj, "SetEventNotification"), flags, 2)
        this.vtbl.SetCooperativeLevel := CallbackCreate(GetMethod(implObj, "SetCooperativeLevel"), flags, 3)
        this.vtbl.GetObjectInfo := CallbackCreate(GetMethod(implObj, "GetObjectInfo"), flags, 4)
        this.vtbl.GetDeviceInfo := CallbackCreate(GetMethod(implObj, "GetDeviceInfo"), flags, 2)
        this.vtbl.RunControlPanel := CallbackCreate(GetMethod(implObj, "RunControlPanel"), flags, 3)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.CreateEffect := CallbackCreate(GetMethod(implObj, "CreateEffect"), flags, 5)
        this.vtbl.EnumEffects := CallbackCreate(GetMethod(implObj, "EnumEffects"), flags, 4)
        this.vtbl.GetEffectInfo := CallbackCreate(GetMethod(implObj, "GetEffectInfo"), flags, 3)
        this.vtbl.GetForceFeedbackState := CallbackCreate(GetMethod(implObj, "GetForceFeedbackState"), flags, 2)
        this.vtbl.SendForceFeedbackCommand := CallbackCreate(GetMethod(implObj, "SendForceFeedbackCommand"), flags, 2)
        this.vtbl.EnumCreatedEffectObjects := CallbackCreate(GetMethod(implObj, "EnumCreatedEffectObjects"), flags, 4)
        this.vtbl.Escape := CallbackCreate(GetMethod(implObj, "Escape"), flags, 2)
        this.vtbl.Poll := CallbackCreate(GetMethod(implObj, "Poll"), flags, 1)
        this.vtbl.SendDeviceData := CallbackCreate(GetMethod(implObj, "SendDeviceData"), flags, 5)
        this.vtbl.EnumEffectsInFile := CallbackCreate(GetMethod(implObj, "EnumEffectsInFile"), flags, 5)
        this.vtbl.WriteEffectToFile := CallbackCreate(GetMethod(implObj, "WriteEffectToFile"), flags, 5)
        this.vtbl.BuildActionMap := CallbackCreate(GetMethod(implObj, "BuildActionMap"), flags, 4)
        this.vtbl.SetActionMap := CallbackCreate(GetMethod(implObj, "SetActionMap"), flags, 4)
        this.vtbl.GetImageInfo := CallbackCreate(GetMethod(implObj, "GetImageInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCapabilities)
        CallbackFree(this.vtbl.EnumObjects)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.Acquire)
        CallbackFree(this.vtbl.Unacquire)
        CallbackFree(this.vtbl.GetDeviceState)
        CallbackFree(this.vtbl.GetDeviceData)
        CallbackFree(this.vtbl.SetDataFormat)
        CallbackFree(this.vtbl.SetEventNotification)
        CallbackFree(this.vtbl.SetCooperativeLevel)
        CallbackFree(this.vtbl.GetObjectInfo)
        CallbackFree(this.vtbl.GetDeviceInfo)
        CallbackFree(this.vtbl.RunControlPanel)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.CreateEffect)
        CallbackFree(this.vtbl.EnumEffects)
        CallbackFree(this.vtbl.GetEffectInfo)
        CallbackFree(this.vtbl.GetForceFeedbackState)
        CallbackFree(this.vtbl.SendForceFeedbackCommand)
        CallbackFree(this.vtbl.EnumCreatedEffectObjects)
        CallbackFree(this.vtbl.Escape)
        CallbackFree(this.vtbl.Poll)
        CallbackFree(this.vtbl.SendDeviceData)
        CallbackFree(this.vtbl.EnumEffectsInFile)
        CallbackFree(this.vtbl.WriteEffectToFile)
        CallbackFree(this.vtbl.BuildActionMap)
        CallbackFree(this.vtbl.SetActionMap)
        CallbackFree(this.vtbl.GetImageInfo)
    }
}
