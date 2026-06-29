#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * ACT_AUTHORIZATION_STATE structure contains data that describes the current authorization state of a Addressable Command Target (ACT).
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/ns-ehstorapi-act_authorization_state
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct ACT_AUTHORIZATION_STATE {
    #StructPack 4

    /**
     * Integer value that indicates the possible authorization state of the ACT.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACT is unauthorized
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACT is authorized
     * 
     * </td>
     * </tr>
     * </table>
     */
    ulState : UInt32

}
