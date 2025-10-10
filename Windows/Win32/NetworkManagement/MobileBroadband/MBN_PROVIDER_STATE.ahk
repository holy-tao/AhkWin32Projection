#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_PROVIDER_STATE enumerated type specifies the various states with which a provider entry can be tagged.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_provider_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PROVIDER_STATE{

    /**
     * Unknown provider state.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_NONE => 0

    /**
     * The provider is a home operator.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_HOME => 1

    /**
     * The provider is on the forbidden list.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_FORBIDDEN => 2

    /**
     * The provider is on the preferred list.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_PREFERRED => 4

    /**
     * The provider is visible.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_VISIBLE => 8

    /**
     * Windows 8 or later: The provider is currently registered by the device.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_REGISTERED => 16

    /**
     * Windows 8 or later: The provider is currently on the preferred multi-carrier list.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDER_STATE_PREFERRED_MULTICARRIER => 32
}
