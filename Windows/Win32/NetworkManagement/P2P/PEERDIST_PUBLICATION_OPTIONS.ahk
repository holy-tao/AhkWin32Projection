#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * PEERDIST_PUBLICATION_OPTIONS structure contains publication options, including the API version information and possible option flags.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ns-peerdist-peerdist_publication_options
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_PUBLICATION_OPTIONS {
    #StructPack 4

    /**
     * The following possible values reflect the version number of the client:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 1.0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 2.0
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * Reserved.
     */
    dwFlags : UInt32

}
