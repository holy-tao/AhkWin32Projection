#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the user's preferred window aspect ratio and conversion method.
 * @remarks
 * 
 * The <b>DVD_PREFERRED_DISPLAY_MODE</b> emumeration indicates the user's preferred window aspect ratio and preferred method of conversion of 16 x 9 content to a 4 x 3 window aspect ratio. Pan-scan and letterboxing are the two conversion methods. Displaying a video at the largest possible size inside the display window without any cropping or stretching is called displaying in letterbox format. <i>Pan-scan</i> is specifically cropping a 16 x 9 video for display in a 4 x 3 window using parameters defined by the video author.
 * 
 * This enumerated type indicates a preference of conversion mechanisms because some content can only be displayed using one of these methods. Content that is 4 x 3 is always converted to a 16 x 9 window by using sideboxing, where black bars are added to the right and left sides of the display instead of the top and bottom of the display as in the 16 x 9 to 4 x 3 conversion using letterboxing.
 * 
 * The following table shows the conversion method used between the actual content type listed in the first column, and the user display preference setting, indicated by one of the other columns.
 * 
 * <table>
 * <tr>
 * <th>Actual content type
 *             </th>
 * <th>16 x 9
 *             </th>
 * <th>4 x 3 pan-scan
 *             </th>
 * <th>4 x 3 letterbox
 *             </th>
 * </tr>
 * <tr>
 * <td>4 x 3</td>
 * <td>Sideboxing</td>
 * <td>None</td>
 * <td>None</td>
 * </tr>
 * <tr>
 * <td>16 x 9 letterbox only</td>
 * <td>None</td>
 * <td>Letterbox</td>
 * <td>Letterbox</td>
 * </tr>
 * <tr>
 * <td>16 x 9 pan-scan only</td>
 * <td>None</td>
 * <td>Pan-scan</td>
 * <td>Pan-scan</td>
 * </tr>
 * <tr>
 * <td>16 x 9 pan-scan or letterbox</td>
 * <td>None</td>
 * <td>Pan-scan</td>
 * <td>Letterbox</td>
 * </tr>
 * </table>
 *  
 * 
 * The native window size used is always the user's preferred size.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_preferred_display_mode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_PREFERRED_DISPLAY_MODE{

    /**
     * Use the default window size and content type.
     * @type {Integer (Int32)}
     */
    static DISPLAY_CONTENT_DEFAULT => 0

    /**
     * Use a 16 x 9 window.
     * @type {Integer (Int32)}
     */
    static DISPLAY_16x9 => 1

    /**
     * Use a 4 x 3 window and convert to pan-scan, if possible.
     * @type {Integer (Int32)}
     */
    static DISPLAY_4x3_PANSCAN_PREFERRED => 2

    /**
     * Use a 4 x 3 window and convert to letterbox, if possible.
     * @type {Integer (Int32)}
     */
    static DISPLAY_4x3_LETTERBOX_PREFERRED => 3
}
