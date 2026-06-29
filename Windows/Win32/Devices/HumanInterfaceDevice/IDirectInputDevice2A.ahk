#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIDEVICEOBJECTDATA.ahk" { DIDEVICEOBJECTDATA }
#Import ".\IDirectInputEffect.ahk" { IDirectInputEffect }
#Import ".\DIEFFECT.ahk" { DIEFFECT }
#Import ".\DIEFFECTINFOA.ahk" { DIEFFECTINFOA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DIEFFESCAPE.ahk" { DIEFFESCAPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectInputDeviceA.ahk" { IDirectInputDeviceA }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct IDirectInputDevice2A extends IDirectInputDeviceA {
    /**
     * The interface identifier for IDirectInputDevice2A
     * @type {Guid}
     */
    static IID := Guid("{5944e682-c92e-11cf-bfc7-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputDevice2A interfaces
    */
    struct Vtbl extends IDirectInputDeviceA.Vtbl {
        CreateEffect             : IntPtr
        EnumEffects              : IntPtr
        GetEffectInfo            : IntPtr
        GetForceFeedbackState    : IntPtr
        SendForceFeedbackCommand : IntPtr
        EnumCreatedEffectObjects : IntPtr
        Escape                   : IntPtr
        Poll                     : IntPtr
        SendDeviceData           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputDevice2A.Vtbl()
        }
        super.__New(implObj, flags)
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

    Query(iid) {
        if (IDirectInputDevice2A.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEffect := CallbackCreate(GetMethod(implObj, "CreateEffect"), flags, 5)
        this.vtbl.EnumEffects := CallbackCreate(GetMethod(implObj, "EnumEffects"), flags, 4)
        this.vtbl.GetEffectInfo := CallbackCreate(GetMethod(implObj, "GetEffectInfo"), flags, 3)
        this.vtbl.GetForceFeedbackState := CallbackCreate(GetMethod(implObj, "GetForceFeedbackState"), flags, 2)
        this.vtbl.SendForceFeedbackCommand := CallbackCreate(GetMethod(implObj, "SendForceFeedbackCommand"), flags, 2)
        this.vtbl.EnumCreatedEffectObjects := CallbackCreate(GetMethod(implObj, "EnumCreatedEffectObjects"), flags, 4)
        this.vtbl.Escape := CallbackCreate(GetMethod(implObj, "Escape"), flags, 2)
        this.vtbl.Poll := CallbackCreate(GetMethod(implObj, "Poll"), flags, 1)
        this.vtbl.SendDeviceData := CallbackCreate(GetMethod(implObj, "SendDeviceData"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEffect)
        CallbackFree(this.vtbl.EnumEffects)
        CallbackFree(this.vtbl.GetEffectInfo)
        CallbackFree(this.vtbl.GetForceFeedbackState)
        CallbackFree(this.vtbl.SendForceFeedbackCommand)
        CallbackFree(this.vtbl.EnumCreatedEffectObjects)
        CallbackFree(this.vtbl.Escape)
        CallbackFree(this.vtbl.Poll)
        CallbackFree(this.vtbl.SendDeviceData)
    }
}
