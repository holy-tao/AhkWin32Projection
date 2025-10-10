#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TS_STATUS structure contains document status data.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms629192(v=vs.85)">TF_STATUS</a> structure contains document status data.
  * 
  * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms629192(v=vs.85)">TF_STATUS</a> is an alias for <b>TS_STATUS</b>.
  * 
  * <b>dwDynamicFlags</b> contains a set of flags that can be changed by an app at run time. For example, an app can enable a check box for the user to reset the status of documentation. This member can contain zero, or one or more of the following values.
  * 
  * <table>
  * <tr>
  * <th>Value</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>TF_SD_LOADING</td>
  * <td>The document is loading.</td>
  * </tr>
  * <tr>
  * <td>TF_SD_READONLY</td>
  * <td>The document is read-only.</td>
  * </tr>
  * <tr>
  * <td>TS_SD_UIINTEGRATIONENABLE</td>
  * <td>
  * <b>Starting with Windows 8.1:</b> The text control owning the document sets this flag to indicate its support of Input Method Editor (IME) UI integration. When specified, the IME should attempt to align the candidate window below the text box instead of floating near the cursor.<div class="alert"><b>Note</b>  Not all IMEs respond to this flag. IME candidate lists are positioned on the screen with sufficient size to allow basic text input. In some cases, the IME may enforce a reasonable minimum size.  An IME might also choose to adjust the candidate window and keyboard input behavior to provide a better user experience, such as using a horizontal candidate list and allowing some keys such as up arrow and down arrow to be sent to the app for scenarios such as suggestion list navigation.</div>
  * <div> </div>
  * </td>
  * </tr>
  * <tr>
  * <td>TF_SD_TKBAUTOCORRECTENABLE</td>
  * <td><b>Starting with Windows 8.1:</b> The document supports autocorrection provided by the touch keyboard. This support can change during the lifetime of the control.</td>
  * </tr>
  * <tr>
  * <td>TF_SD_TKBPREDICTIONENABLE</td>
  * <td><b>Starting with Windows 8.1:</b> The document supports text suggestions provided by the touch keyboard. This support can change during the lifetime of the control.</td>
  * </tr>
  * </table>
  *  
  * 
  * <b>dwStaticFlags</b> contains a set of flags that cannot be changed at run time. This member can contain zero, or one or more of the following values.
  * 
  * <table>
  * <tr>
  * <th>Value</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>TF_SS_DISJOINTSEL</td>
  * <td>The document supports multiple selections.</td>
  * </tr>
  * <tr>
  * <td>TF_SS_REGIONS</td>
  * <td>The document can contain multiple regions.</td>
  * </tr>
  * <tr>
  * <td>TF_SS_TRANSITORY</td>
  * <td>The document is expected to have a short usage cycle.</td>
  * </tr>
  * <tr>
  * <td>TF_SS_TKBAUTOCORRECTENABLE</td>
  * <td><b>Starting with Windows 8:</b> The document supports autocorrection provided by the touch keyboard.</td>
  * </tr>
  * <tr>
  * <td>TF_SS_TKBPREDICTIONENABLE</td>
  * <td><b>Starting with Windows 8:</b> The document supports text suggestions provided by the touch keyboard.</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ns-textstor-ts_status
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TS_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    dwDynamicFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwStaticFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
