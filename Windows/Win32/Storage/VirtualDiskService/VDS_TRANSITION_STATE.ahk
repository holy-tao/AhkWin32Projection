#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of the valid transition state values for a VDS object.
 * @remarks
 * 
 * Transition state enumeration values apply to the VDS objects as shown in the following table. Y indicates that the value 
 *     applies to the object, and N indicates that the value does not apply to the object. 
 * 
 * <table>
 * <tr>
 * <th>Transition state enumeration value</th>
 * <th>LUN</th>
 * <th>LUN plex</th>
 * <th>Volume</th>
 * <th>Volume plex</th>
 * </tr>
 * <tr>
 * <td><b>VDS_TS_UNKNOWN</b></td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>N</td>
 * <td>N</td>
 * </tr>
 * <tr>
 * <td><b>VDS_TS_STABLE</b></td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>Y</td>
 * </tr>
 * <tr>
 * <td><b>VDS_TS_EXTENDING</b></td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>N</td>
 * <td>N</td>
 * </tr>
 * <tr>
 * <td><b>VDS_TS_SHRINKING</b></td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>N</td>
 * <td>N</td>
 * </tr>
 * <tr>
 * <td><b>VDS_TS_RECONFIGING</b></td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>N</td>
 * <td>N</td>
 * </tr>
 * <tr>
 * <td><b>VDS_TS_RESTRIPING</b></td>
 * <td>Y</td>
 * <td>Y</td>
 * <td>N</td>
 * <td>N</td>
 * </tr>
 * </table>
 *  
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop">VDS_LUN_PLEX_PROP</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop2">VDS_VOLUME_PROP2</a>, and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_plex_prop">VDS_VOLUME_PLEX_PROP</a> structures include a <b>VDS_TRANSITION_STATE</b> 
 *     value as a member to report the transition state of each object.
 * 
 * If your application encounters a <b>VDS_TRANSITION_STATE</b> value that it does not recognize, it should display the transition state as unknown. It should not attempt to map the unrecognized transition state to another transition state.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_TRANSITION_STATE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_TRANSITION_STATE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_transition_state
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_TRANSITION_STATE{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_TS_UNKNOWN => 0

    /**
     * The object is stable. No configuration activity is currently in progress.
     * @type {Integer (Int32)}
     */
    static VDS_TS_STABLE => 1

    /**
     * The object is being extended.
     * @type {Integer (Int32)}
     */
    static VDS_TS_EXTENDING => 2

    /**
     * The object is being shrunk.
     * @type {Integer (Int32)}
     */
    static VDS_TS_SHRINKING => 3

    /**
     * The object is being automagically reconfigured.
     * @type {Integer (Int32)}
     */
    static VDS_TS_RECONFIGING => 4

    /**
     * The object is being restriped.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_TS_RESTRIPING => 5
}
