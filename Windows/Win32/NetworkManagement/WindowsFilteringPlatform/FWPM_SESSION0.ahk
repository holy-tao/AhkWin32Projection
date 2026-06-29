#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores the state associated with a client session.
 * @remarks
 * This structure contains information supplied by the client when creating a session by calling <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>, or information retrieved from the system when enumerating sessions by calling <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessionenum0">FwpmSessionEnum0</a>.
 * 
 * The members <b>processId</b>, <b>sid</b>,  <b>username</b>, and <b>kernelMode</b> are not supplied by the client. They are supplied by BFE and can be retrieved when enumerating sessions.
 * 
 * <b>FWPM_SESSION0</b> is a specific implementation of FWPM_SESSION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_session0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SESSION0 {
    #StructPack 8

    /**
     * Uniquely identifies the session. 
     * 
     * If this member is zero in the
     *    call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>, Base Filtering Engine (BFE) will generate a GUID.
     */
    sessionKey : Guid

    /**
     * Allows sessions to be annotated in a human-readable form.
     * 
     * See [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) for more information.
     */
    displayData : FWPM_DISPLAY_DATA0

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
     */
    flags : UInt32

    /**
     * Time in milli-seconds that a client will wait to begin a transaction. 
     * 
     * If this member is zero, BFE will use a
     *    default timeout.
     */
    txnWaitTimeoutInMSec : UInt32

    /**
     * Process ID of the client.
     */
    processId : UInt32

    /**
     * SID of the client.
     */
    sid : SID.Ptr

    /**
     * User name of the client.
     */
    username : PWSTR

    /**
     * TRUE if this is a kernel-mode client.
     */
    kernelMode : BOOL

}
