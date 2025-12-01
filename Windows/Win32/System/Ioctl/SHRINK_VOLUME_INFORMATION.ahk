#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the volume shrink operation to perform.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-shrink_volume_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SHRINK_VOLUME_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    ShrinkRequestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This member must be zero.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of sectors that should be in the shrunken volume. Used only when the <b>ShrinkRequestType</b> member is <b>ShrinkPrepare</b>, otherwise this member should be initialized to zero.
     * @type {Integer}
     */
    NewNumberOfSectors {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
