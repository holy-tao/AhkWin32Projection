#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_SCANLINE_ORDERING.ahk" { DISPLAYCONFIG_SCANLINE_ORDERING }
#Import ".\DISPLAYCONFIG_SCALING.ahk" { DISPLAYCONFIG_SCALING }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DISPLAYCONFIG_ROTATION.ahk" { DISPLAYCONFIG_ROTATION }
#Import ".\DISPLAYCONFIG_PATH_TARGET_INFO.ahk" { DISPLAYCONFIG_PATH_TARGET_INFO }
#Import ".\DISPLAYCONFIG_RATIONAL.ahk" { DISPLAYCONFIG_RATIONAL }
#Import ".\DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY.ahk" { DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY }
#Import ".\DISPLAYCONFIG_PATH_SOURCE_INFO.ahk" { DISPLAYCONFIG_PATH_SOURCE_INFO }

/**
 * The DISPLAYCONFIG_PATH_INFO structure is used to describe a single path from a target to a source.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_path_info
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_PATH_INFO {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_source_info">DISPLAYCONFIG_PATH_SOURCE_INFO</a> structure that contains the source information for the path.
     */
    sourceInfo : DISPLAYCONFIG_PATH_SOURCE_INFO

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structure that contains the target information for the path.
     */
    targetInfo : DISPLAYCONFIG_PATH_TARGET_INFO

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
     */
    flags : UInt32

}
