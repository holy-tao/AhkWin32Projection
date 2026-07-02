#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RESULTTYPES.ahk" { RESULTTYPES }

/**
 * The LPDISPLAYVAL function specification defines a callback function prototype. The IValidate::SetDisplay method enables an authoring tool to receive ICE status messages through the registered callback function.
 * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nc-evalcom2-lpdisplayval
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct LPDISPLAYVAL {
    value : IntPtr

    __value {
        set {
            if (value is LPDISPLAYVAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pContext A pointer to an application context passed to the <a href="https://docs.microsoft.com/windows/desktop/api/evalcom2/nf-evalcom2-ivalidate-setdisplay">SetDisplay</a> method. 
     * 
     * This parameter can be used for error checking.
     * @param {RESULTTYPES} uiType Specifies the type of message sent by the ICE.
     * @param {PWSTR} szwVal The name of the ICE reporting the message, or an error reported by evalcom2 during validation.
     * @param {PWSTR} szwDescription The message text.
     * @param {PWSTR} szwLocation The location of the error. 
     * 
     * This parameter can be <b>NULL</b> if the error does not refer to an actual database table or row. Specify the location of the error using the following format: Table\tColumn\tPrimaryKey1[\tPrimaryKey2\ . . .].
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>TRUE</b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation procedure should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>FALSE</b></b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation was canceled. The callback function return <b>FALSE</b> to stop validation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pContext, uiType, szwVal, szwDescription, szwLocation) {
        szwVal := szwVal is String ? StrPtr(szwVal) : szwVal
        szwDescription := szwDescription is String ? StrPtr(szwDescription) : szwDescription
        szwLocation := szwLocation is String ? StrPtr(szwLocation) : szwLocation

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, RESULTTYPES, uiType, "ptr", szwVal, "ptr", szwDescription, "ptr", szwLocation, BOOL)
        return result
    }

    /**
     * A LPDISPLAYVAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDISPLAYVAL {
        /**
         * Creates a LPDISPLAYVAL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", RESULTTYPES, PWSTR, PWSTR, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", RESULTTYPES, PWSTR, PWSTR, PWSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
