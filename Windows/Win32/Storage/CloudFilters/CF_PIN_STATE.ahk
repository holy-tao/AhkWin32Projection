#Requires AutoHotkey v2.0.0 64-bit

/**
 * Pin states of a placeholder file or directory.
 * @remarks
 * <table>
  * <tr>
  * <th></th>
  * <th>Parent</th>
  * <th>Unspecified</th>
  * <th>Pinned</th>
  * <th>Unpinned</th>
  * <th>Excluded</th>
  * </tr>
  * <tr>
  * <th>File</th>
  * <td>Unspecified</td>
  * <td>Unspecified</td>
  * <td>Pinned</td>
  * <td>Unspecified</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th></th>
  * <td>Pinned</td>
  * <td>Pinned</td>
  * <td>Pinned</td>
  * <td>Pinned</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th></th>
  * <td>Unpinned</td>
  * <td>Unpinned</td>
  * <td>Unpinned</td>
  * <td>Unpinned</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th></th>
  * <td>Excluded</td>
  * <td>Unspecified</td>
  * <td>Pinned</td>
  * <td>Unspecified</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th>Directory</th>
  * <td>Unspecified</td>
  * <td>Unspecified</td>
  * <td>Pinned</td>
  * <td>Unpinned</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th></th>
  * <td>Pinned</td>
  * <td>Pinned</td>
  * <td>Pinned</td>
  * <td>Pinned</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th></th>
  * <td>Unpinned</td>
  * <td>Unpinned</td>
  * <td>Unpinned</td>
  * <td>Unpinned</td>
  * <td>Excluded</td>
  * </tr>
  * <tr>
  * <th></th>
  * <td>Excluded</td>
  * <td>Unspecified</td>
  * <td>Pinned</td>
  * <td>Unpinned</td>
  * <td>Excluded</td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_pin_state
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PIN_STATE{

    /**
     * The platform can decide freely when the placeholder’s content needs to present or absent locally on the disk.
     * @type {Integer (Int32)}
     */
    static CF_PIN_STATE_UNSPECIFIED => 0

    /**
     * The sync provider will be notified to fetch the placeholder’s content asynchronously after the pin request is received by the platform. There is no guarantee that the placeholders to be pinned will be fully available locally after a [CfSetPinState](nf-cfapi-cfsetpinstate.md) call completes successfully. However, the platform will fail any dehydration request on pinned placeholders.
     * @type {Integer (Int32)}
     */
    static CF_PIN_STATE_PINNED => 1

    /**
     * The sync provider will be notified to dehydrate/invalidate the placeholder’s content on-disk asynchronously after the unpin request is received by the platform. There is no guarantee that the placeholders to be unpinned will be fully dehydrated after the API call completes successfully.
     * @type {Integer (Int32)}
     */
    static CF_PIN_STATE_UNPINNED => 2

    /**
     * the placeholder will never be synced to the cloud by the sync provider. This state can only be set by the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_PIN_STATE_EXCLUDED => 3

    /**
     * The platform treats it as if the caller performs a move operation on the placeholder and hence re-evaluates the placeholder’s pin state based on its parent’s pin state. See the [Remarks](#-remarks) section for an inheritance table.
     * @type {Integer (Int32)}
     */
    static CF_PIN_STATE_INHERIT => 4
}
