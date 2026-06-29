#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains dynamic exception handling continuation targets.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_dynamic_eh_continuation_target
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGET {
    #StructPack 8

    /**
     * The address of a dynamic exception handling continuation target.
     */
    TargetAddress : IntPtr

    /**
     * Flags that apply to the dynamic exception handling continuation target in <i>TargetAddress</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DYNAMIC_EH_CONTINUATION_TARGET_ADD"></a><a id="dynamic_eh_continuation_target_add"></a><dl>
     * <dt><b>DYNAMIC_EH_CONTINUATION_TARGET_ADD</b></dt>
     * <dt>0x00000001UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dynamic exception handling continuation target should be added. If this flag is not set, the target is removed. This is an input flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DYNAMIC_EH_CONTINUATION_TARGET_PROCESSED"></a><a id="dynamic_eh_continuation_target_processed"></a><dl>
     * <dt><b>DYNAMIC_EH_CONTINUATION_TARGET_PROCESSED</b></dt>
     * <dt>0x00000002UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dynamic exception handling continuation target has been successfully processed (either added or removed).
     * This is an output flag used to report which targets were successfully processed when processing an array of multiple targets.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : IntPtr

}
