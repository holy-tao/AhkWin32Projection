#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the throttling policies and how to apply them to a target process when that process is subject to power management.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_power_throttling_state
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_POWER_THROTTLING_STATE {
    #StructPack 4

    /**
     * The version of the <b>PROCESS_POWER_THROTTLING_STATE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_POWER_THROTTLING_CURRENT_VERSION"></a><a id="process_power_throttling_current_version"></a><dl>
     * <dt><b>PROCESS_POWER_THROTTLING_CURRENT_VERSION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current version.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Version : UInt32

    /**
     * This field enables the caller to take control of the power throttling mechanism.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_POWER_THROTTLING_EXECUTION_SPEED"></a><a id="process_power_throttling_execution_speed"></a><dl>
     * <dt><b>PROCESS_POWER_THROTTLING_EXECUTION_SPEED</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Manages the execution speed of the process.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ControlMask : UInt32

    /**
     * Manages the power throttling mechanism on/off state.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_POWER_THROTTLING_EXECUTION_SPEED"></a><a id="process_power_throttling_execution_speed"></a><dl>
     * <dt><b>PROCESS_POWER_THROTTLING_EXECUTION_SPEED</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Manages the execution speed of the process.
     * 
     * </td>
     * </tr>
     * </table>
     */
    StateMask : UInt32

}
