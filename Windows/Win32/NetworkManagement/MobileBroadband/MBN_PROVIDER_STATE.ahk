#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_PROVIDER_STATE enumerated type specifies the various states with which a provider entry can be tagged.
 * @remarks
 * The following table provides the valid combinations of values for different operations.
 * 
 * <table>
 * <tr>
 * <th>Operation</th>
 * <th>MBN_PROVIDER_STATE</th>
 * </tr>
 * <tr>
 * <td>Query Home Provider</td>
 * <td>MBN_PROVIDER_STATE_HOME</td>
 * </tr>
 * <tr>
 * <td rowspan="2">Query Preferred Providers</td>
 * <td>MBN_PROVIDER_STATE_FORBIDDEN</td>
 * </tr>
 * <tr>
 * <td>MBN_PROVIDER_STATE_PREFERRED</td>
 * </tr>
 * <tr>
 * <td rowspan="4">Query Visible Providers</td>
 * <td>MBN_PROVIDER_STATE_REGISTERED</td>
 * </tr>
 * <tr>
 * <td>MBN_PROVIDER_STATE_HOME</td>
 * </tr>
 * <tr>
 * <td>MBN_PROVIDER_STATE_PREFERRED</td>
 * </tr>
 * <tr>
 * <td>MBN_PROVIDER_STATE_FORBIDDEN</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_provider_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_PROVIDER_STATE extends Win32Enum {

    /**
     * Unknown provider state.
     * Native name: MBN_PROVIDER_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The provider is a home operator.
     * Native name: MBN_PROVIDER_STATE_HOME
     * @type {Integer (Int32)}
     */
    static HOME => 1

    /**
     * The provider is on the forbidden list.
     * Native name: MBN_PROVIDER_STATE_FORBIDDEN
     * @type {Integer (Int32)}
     */
    static FORBIDDEN => 2

    /**
     * The provider is on the preferred list.
     * Native name: MBN_PROVIDER_STATE_PREFERRED
     * @type {Integer (Int32)}
     */
    static PREFERRED => 4

    /**
     * The provider is visible.
     * Native name: MBN_PROVIDER_STATE_VISIBLE
     * @type {Integer (Int32)}
     */
    static VISIBLE => 8

    /**
     * Windows 8 or later: The provider is currently registered by the device.
     * Native name: MBN_PROVIDER_STATE_REGISTERED
     * @type {Integer (Int32)}
     */
    static REGISTERED => 16

    /**
     * Windows 8 or later: The provider is currently on the preferred multi-carrier list.
     * Native name: MBN_PROVIDER_STATE_PREFERRED_MULTICARRIER
     * @type {Integer (Int32)}
     */
    static PREFERRED_MULTICARRIER => 32
}
