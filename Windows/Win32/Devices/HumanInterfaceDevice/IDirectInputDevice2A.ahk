#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectInputEffect.ahk
#Include .\IDirectInputDeviceA.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class IDirectInputDevice2A extends IDirectInputDeviceA{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputDevice2A
     * @type {Guid}
     */
    static IID => Guid("{5944e682-c92e-11cf-bfc7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEffect", "EnumEffects", "GetEffectInfo", "GetForceFeedbackState", "SendForceFeedbackCommand", "EnumCreatedEffectObjects", "Escape", "Poll", "SendDeviceData"]

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<DIEFFECT>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectInputEffect} 
     */
    CreateEffect(param0, param1, param3) {
        result := ComCall(18, this, "ptr", param0, "ptr", param1, "ptr*", &param2 := 0, "ptr", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(19, this, "ptr", param0, param1Marshal, param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECTINFOA>} param0 
     * @param {Pointer<Guid>} param1 
     * @returns {HRESULT} 
     */
    GetEffectInfo(param0, param1) {
        result := ComCall(20, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetForceFeedbackState(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    SendForceFeedbackCommand(param0) {
        result := ComCall(22, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(23, this, "ptr", param0, param1Marshal, param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-escape
     */
    Escape(param0) {
        result := ComCall(24, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Poll() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(26, this, "uint", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
