#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * Applications use the WIA_DEV_CAP structure to enumerate device capabilities. A device capability is defined by an event or command that the device supports. For more information, see IEnumWIA_DEV_CAPS.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/ns-wia_xp-wia_dev_cap
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_DEV_CAP extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * Specifies a GUID that identifies the device capability. This member can be set to any of the values specified in <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-device-commands">WIA Device Commands</a> or <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-event-identifiers">WIA Event Identifiers</a>.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Used when enumerating event handlers. The possible values are listed in this table.
     *                 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WIA_IS_DEFAULT_HANDLER</td>
     * <td>The currently registered handler should be used. This is the only valid value when enumerating event handlers. It is not a valid value when enumerating event capabilities of a device.</td>
     * </tr>
     * <tr>
     * <td>WIA_ACTION_EVENT</td>
     * <td>The event is of the action type, so programs that use persistent registration APIs, <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackprogram">IWiaDevMgr::RegisterEventCallbackProgram</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackclsid">IWiaDevMgr::RegisterEventCallbackCLSID</a>, can receive it. </td>
     * </tr>
     * <tr>
     * <td>WIA_NOTIFICATION_EVENT</td>
     * <td>The event is of the notification type, so programs that use the runtime registration function, <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackinterface">IWiaDevMgr::RegisterEventCallbackInterface</a>, can receive it. </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BSTR</b>
     * 
     * Specifies a string that contains a short version of the capability name.
     * @type {BSTR}
     */
    bstrName{
        get {
            if(!this.HasProp("__bstrName"))
                this.__bstrName := BSTR(16, this)
            return this.__bstrName
        }
    }

    /**
     * Type: <b>BSTR</b>
     * 
     * Specifies a string that contains a description of the capability that is displayed to the user.
     * @type {BSTR}
     */
    bstrDescription{
        get {
            if(!this.HasProp("__bstrDescription"))
                this.__bstrDescription := BSTR(24, this)
            return this.__bstrDescription
        }
    }

    /**
     * Type: <b>BSTR</b>
     * 
     * Specifies a string that represents the location and resource ID of the icon that represents this capability or handler. The string must be of the following form: <i>drive</i><b>:\\</b><i>path</i><b>\\</b><i>module</i><b>,</b><i>n</i>, where <i>n</i> is the icon's negated resource ID (that is, if the resource ID of the icon is 100, then <i>n</i> is -100).
     * @type {BSTR}
     */
    bstrIcon{
        get {
            if(!this.HasProp("__bstrIcon"))
                this.__bstrIcon := BSTR(32, this)
            return this.__bstrIcon
        }
    }

    /**
     * Type: <b>BSTR</b>
     * 
     * Specifies a string that represents command line arguments.
     * @type {BSTR}
     */
    bstrCommandline{
        get {
            if(!this.HasProp("__bstrCommandline"))
                this.__bstrCommandline := BSTR(40, this)
            return this.__bstrCommandline
        }
    }
}
