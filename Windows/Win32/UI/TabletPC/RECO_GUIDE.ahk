#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the boundaries of the ink to the recognizer.
 * @remarks
 * If the application has drawn guidelines on the screen on which the user is expected to write, the application should set the values in the <b>RECO_GUIDE</b> structure to inform the recognizer. The <b>RECO_GUIDE</b> structure is for the recognizer's use only. Setting the <b>RECO_GUIDE</b> structure does not, by itself, draw visual clues on the display. The application or the control draws the visual clues.
  * 
  * The xOrigin and yOrigin members are ink-space coordinates of the upper-left corner of the area to write in. The cyBox and cxBox members are the height and width of the individual boxes to write in. If the guide is lined, they cyBox and cxBox width/height of every line. The cHorzBox and cVertBox members specify the number of columns and rows. The cyBase member specifies a baseline within the box. Setting the cyBase member to 0 indicates that there is no baseline. The cxBase member gives a horizontal displacement of the edge of the guideline from the edge of the box where writing is expected to start.
  * 
  * Use the values of cHorzBox and cVertBox to control the kind of recognition input that you use. When cHorzBox and cVertBox are both greater than zero, boxed input is used. The following table lists potential input modes and which values to set cHorzBox and cVertBox for each mode.
  * 
  * <table>
  * <tr>
  * <th>For this type of input</th>
  * <th>Set cHorzBox equal to</th>
  * <th>And set cVertBox equal to</th>
  * </tr>
  * <tr>
  * <td>
  * Free input
  * 
  * </td>
  * <td>
  * 0
  * 
  * </td>
  * <td>
  * 0
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Lined input with 1 horizontal line
  * 
  * </td>
  * <td>
  * 0
  * 
  * </td>
  * <td>
  * 1
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Lined input with 1 vertical line
  * 
  * </td>
  * <td>
  * 1
  * 
  * </td>
  * <td>
  * 0
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Lined input with n horizontal lines
  * 
  * </td>
  * <td>
  * 0
  * 
  * </td>
  * <td>
  * n
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Lined input with n vertical lines
  * 
  * </td>
  * <td>
  * n
  * 
  * </td>
  * <td>
  * 0
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Boxed input with 1 box
  * 
  * </td>
  * <td>
  * 1
  * 
  * </td>
  * <td>
  * 1
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Boxed input in a horizontal line with n boxes
  * 
  * </td>
  * <td>
  * n
  * 
  * </td>
  * <td>
  * 1
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * Boxed input in a grid of boxes x rows by z columns
  * 
  * </td>
  * <td>
  * z
  * 
  * </td>
  * <td>
  * x
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * The following illustration represents the recognition guide structure for five columns and three rows of boxes.
  * 
  * <img alt="Illustration of recognition guide structure" border="" src="images/3551c7eb-7398-4724-9de7-191818f35443.gif"/>
  * The following illustration represents a single box from the previous illustration.
  * 
  * <img alt="Illustration of single recognition guide box" border="" src="images/a7106d81-4314-44ec-905d-1bb3ba7711b7.gif"/>
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_guide
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_GUIDE extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Left edge of the first box in ink space coordinates.
     * @type {Integer}
     */
    xOrigin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Top edge of first box in ink-space coordinates.
     * @type {Integer}
     */
    yOrigin {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Width of each box in ink space units.
     * @type {Integer}
     */
    cxBox {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Height of each box in ink-space units.
     * @type {Integer}
     */
    cyBox {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Margin to the guideline. This is one-half the distance in ink-space units between adjacent boxes.
     * @type {Integer}
     */
    cxBase {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Vertical distance in ink-space units from the baseline to the top of the box.
     * @type {Integer}
     */
    cyBase {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Count of columns of boxes.
     * @type {Integer}
     */
    cHorzBox {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Count of rows of boxes.
     * @type {Integer}
     */
    cVertBox {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Distance in ink-space units from the baseline to the midline, or 0 if the midline is not present.
     * @type {Integer}
     */
    cyMid {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
