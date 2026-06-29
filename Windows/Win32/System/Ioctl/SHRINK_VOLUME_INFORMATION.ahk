#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SHRINK_VOLUME_REQUEST_TYPES.ahk" { SHRINK_VOLUME_REQUEST_TYPES }

/**
 * Specifies the volume shrink operation to perform.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-shrink_volume_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SHRINK_VOLUME_INFORMATION {
    #StructPack 8

    /**
     * Indicates the operation to perform. The valid values are as follows. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ShrinkPrepare"></a><a id="shrinkprepare"></a><a id="SHRINKPREPARE"></a><dl>
     * <dt><b>ShrinkPrepare</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Volume should perform any steps necessary to prepare for a shrink operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ShrinkCommit"></a><a id="shrinkcommit"></a><a id="SHRINKCOMMIT"></a><dl>
     * <dt><b>ShrinkCommit</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Volume should commit the shrink operation changes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ShrinkAbort"></a><a id="shrinkabort"></a><a id="SHRINKABORT"></a><dl>
     * <dt><b>ShrinkAbort</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Volume should terminate the shrink operation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ShrinkRequestType : SHRINK_VOLUME_REQUEST_TYPES

    /**
     * This member must be zero.
     */
    Flags : Int64

    /**
     * The number of sectors that should be in the shrunken volume. Used only when the <b>ShrinkRequestType</b> member is <b>ShrinkPrepare</b>, otherwise this member should be initialized to zero.
     */
    NewNumberOfSectors : Int64

}
