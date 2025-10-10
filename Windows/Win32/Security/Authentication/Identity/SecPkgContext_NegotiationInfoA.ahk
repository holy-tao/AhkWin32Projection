#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_NegotiationInfo structure contains information on the security package that is being set up or has been set up, and also gives the status on the negotiation to set up the security package.
 * @remarks
 * 
  * > [!NOTE]
  * > The sspi.h header defines SecPkgContext_NegotiationInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_negotiationinfoa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SecPkgContext_NegotiationInfoA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that provides general information about the security package chosen in the negotiate process, such as the name and capabilities of the package.
     * @type {Pointer<SecPkgInfoA>}
     */
    PackageInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicator of the state of the negotiation for the security package identified in the <b>PackageInfo</b> member. This attribute can be queried from the context handle before the setup is complete, such as when ISC returns SEC_I_CONTINUE_NEEDED.
     * 
     * The following table shows values returned in this member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_NEGOTIATION_COMPLETE"></a><a id="secpkg_negotiation_complete"></a><dl>
     * <dt><b>SECPKG_NEGOTIATION_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiation has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_NEGOTIATION_OPTIMISTIC"></a><a id="secpkg_negotiation_optimistic"></a><dl>
     * <dt><b>SECPKG_NEGOTIATION_OPTIMISTIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiations not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_NEGOTIATION_IN_PROGRESS"></a><a id="secpkg_negotiation_in_progress"></a><dl>
     * <dt><b>SECPKG_NEGOTIATION_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiations in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    NegotiationState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
