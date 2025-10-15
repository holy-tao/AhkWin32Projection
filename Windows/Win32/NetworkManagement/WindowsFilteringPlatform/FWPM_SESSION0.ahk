#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Stores the state associated with a client session.
 * @remarks
 * 
  * This structure contains information supplied by the client when creating a session by calling <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>, or information retrieved from the system when enumerating sessions by calling <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessionenum0">FwpmSessionEnum0</a>.
  * 
  * The members <b>processId</b>, <b>sid</b>,  <b>username</b>, and <b>kernelMode</b> are not supplied by the client. They are supplied by BFE and can be retrieved when enumerating sessions.
  * 
  * <b>FWPM_SESSION0</b> is a specific implementation of FWPM_SESSION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_session0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SESSION0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Uniquely identifies the session. 
     * 
     * If this member is zero in the
     *    call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>, Base Filtering Engine (BFE) will generate a GUID.
     * @type {Pointer<Guid>}
     */
    sessionKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Allows sessions to be annotated in a human-readable form.
     * 
     * See [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) for more information.
     * @type {FWPM_DISPLAY_DATA0}
     */
    displayData{
        get {
            if(!this.HasProp("__displayData"))
                this.__displayData := FWPM_DISPLAY_DATA0(this.ptr + 8)
            return this.__displayData
        }
    }

    /**
     * Settings to control session behavior.
     * 
     * <table>
     * <tr>
     * <th>Session flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SESSION_FLAG_DYNAMIC"></a><a id="fwpm_session_flag_dynamic"></a><dl>
     * <dt><b>FWPM_SESSION_FLAG_DYNAMIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When this flag is set, any objects added during the session are
     * automatically deleted when the session ends.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SESSION_FLAG_RESERVED"></a><a id="fwpm_session_flag_reserved"></a><dl>
     * <dt><b>FWPM_SESSION_FLAG_RESERVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Time in milli-seconds that a client will wait to begin a transaction. 
     * 
     * If this member is zero, BFE will use a
     *    default timeout.
     * @type {Integer}
     */
    txnWaitTimeoutInMSec {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Process ID of the client.
     * @type {Integer}
     */
    processId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * SID of the client.
     * @type {Pointer<SID>}
     */
    sid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * User name of the client.
     * @type {PWSTR}
     */
    username{
        get {
            if(!this.HasProp("__username"))
                this.__username := PWSTR(this.ptr + 48)
            return this.__username
        }
    }

    /**
     * TRUE if this is a kernel-mode client.
     * @type {BOOL}
     */
    kernelMode{
        get {
            if(!this.HasProp("__kernelMode"))
                this.__kernelMode := BOOL(this.ptr + 56)
            return this.__kernelMode
        }
    }
}
