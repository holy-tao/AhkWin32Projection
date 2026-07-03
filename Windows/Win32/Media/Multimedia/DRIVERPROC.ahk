#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\HDRVR.ahk" { HDRVR }

/**
 * Processes driver messages for the installable driver. DriverProc is a driver-supplied function.
 * @remarks
 * When <i>msg</i> is <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-open">DRV_OPEN</a>, <i>lParam1</i> is the string following the driver filename from the SYSTEM.INI file and <i>lParam2</i> is the value given as the <i>lParam</i> parameter in a call to the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
 * 
 * When <i>msg</i> is <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-close">DRV_CLOSE</a>, <i>lParam1</i> and <i>lParam2</i> are the same values as the <i>lParam1</i> and <i>lParam2</i> parameters in a call to the <a href="https://docs.microsoft.com/previous-versions/dd797785(v=vs.85)">CloseDriver</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/nc-mmiscapi-driverproc
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct DRIVERPROC {
    value : IntPtr

    __value {
        set {
            if (value is DRIVERPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 Identifier of the installable driver.
     * @param {HDRVR} param1 Handle of the installable driver instance. Each instance of the installable driver has a unique handle.
     * @param {Integer} param2 Driver message value. It can be a custom value or one of these standard values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_CLOSE"></a><a id="drv_close"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-close">DRV_CLOSE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it should decrement its usage count and unload the driver if the count is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_CONFIGURE"></a><a id="drv_configure"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-configure">DRV_CONFIGURE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it should display a configuration dialog box. This message is sent only if the driver returns a nonzero value when processing the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a> message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_DISABLE"></a><a id="drv_disable"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-disable">DRV_DISABLE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that its allocated memory is about to be freed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_ENABLE"></a><a id="drv_enable"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-enable">DRV_ENABLE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it has been loaded or reloaded or that Windows has been enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_FREE"></a><a id="drv_free"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-free">DRV_FREE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it will be discarded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_INSTALL"></a><a id="drv_install"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-install">DRV_INSTALL</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it has been successfully installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_LOAD"></a><a id="drv_load"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-load">DRV_LOAD</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it has been successfully loaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_OPEN"></a><a id="drv_open"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-open">DRV_OPEN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it is about to be opened.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_POWER"></a><a id="drv_power"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-power">DRV_POWER</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that the device's power source is about to be turned on or off.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_QUERYCONFIGURE"></a><a id="drv_queryconfigure"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-queryconfigure">DRV_QUERYCONFIGURE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Directs the driver to specify whether it supports the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-configure">DRV_CONFIGURE</a> message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRV_REMOVE"></a><a id="drv_remove"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-remove">DRV_REMOVE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies the driver that it is about to be removed from the system.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {LPARAM} param3 32-bit message-specific value.
     * @param {LPARAM} param4 32-bit message-specific value.
     * @returns {LRESULT} Returns nonzero if successful or zero otherwise.
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, IntPtr, param0, HDRVR, param1, UInt32, param2, LPARAM, param3, LPARAM, param4, LRESULT)
        return result
    }

    /**
     * A DRIVERPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVERPROC {
        /**
         * Creates a DRIVERPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, HDRVR, UInt32, LPARAM, LPARAM) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, HDRVR, UInt32, LPARAM, LPARAM, LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
