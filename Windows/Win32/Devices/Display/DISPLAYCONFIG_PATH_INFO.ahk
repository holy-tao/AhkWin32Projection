#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_PATH_SOURCE_INFO.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk
#Include .\DISPLAYCONFIG_PATH_TARGET_INFO.ahk

/**
 * The DISPLAYCONFIG_PATH_INFO structure is used to describe a single path from a target to a source.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_path_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_PATH_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_source_info">DISPLAYCONFIG_PATH_SOURCE_INFO</a> structure that contains the source information for the path.
     * @type {DISPLAYCONFIG_PATH_SOURCE_INFO}
     */
    sourceInfo{
        get {
            if(!this.HasProp("__sourceInfo"))
                this.__sourceInfo := DISPLAYCONFIG_PATH_SOURCE_INFO(0, this)
            return this.__sourceInfo
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structure that contains the target information for the path.
     * @type {DISPLAYCONFIG_PATH_TARGET_INFO}
     */
    targetInfo{
        get {
            if(!this.HasProp("__targetInfo"))
                this.__targetInfo := DISPLAYCONFIG_PATH_TARGET_INFO(20, this)
            return this.__targetInfo
        }
    }

    /**
     * A bitwise OR of flag values that indicates the state of the path. The following values are supported:
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_PATH_ACTIVE"></a><a id="displayconfig_path_active"></a><dl>
     * <dt><b>DISPLAYCONFIG_PATH_ACTIVE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> to indicate that the path is active and part of the desktop. If this flag value is set, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> attempts to enable this path.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_PATH_SUPPORT_VIRTUAL_MODE"></a><a id="displayconfig_path_support_virtual_mode"></a><dl>
     * <dt><b>DISPLAYCONFIG_PATH_SUPPORT_VIRTUAL_MODE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> to indicate that the path supports virtual modes. Supported starting in Windows 10.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_PATH_BOOST_REFRESH_RATE"></a><a id="displayconfig_path_boost_refresh_rate"></a><dl>
     * <dt><b>DISPLAYCONFIG_PATH_BOOST_REFRESH_RATE</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> to indicate that the path supports virtual refresh rates. Supported starting in Windows 11.
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
