#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IImePad interface inserts text into apps from IMEPadApplets that implement the IImePadApplet interface.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/nn-imepad-iimepad
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IImePad extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImePad
     * @type {Guid}
     */
    static IID => Guid("{5d8e643a-c3a9-11d1-afef-00805f0c8b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Request"]

    /**
     * Called by an IImePadApplet to insert text into an app.
     * @remarks
     * <h3><a id="Possible_IMEPADCTRL___values"></a><a id="possible_imepadctrl___values"></a><a id="POSSIBLE_IMEPADCTRL___VALUES"></a>Possible <b>IMEPADCTRL_*</b> values</h3>
     * These are the possible values that <i>wParam</i> can take when <i>reqId</i> is set to <b>IMEPADREQ_SENDCONTROL</b>:<table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CONVERTALL</b></td>
     * <td>1</td>
     * <td>Convert all composition strings.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_DETERMINALL</b></td>
     * <td>2</td>
     * <td>Determine all composition strings.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_DETERMINCHAR</b></td>
     * <td>3</td>
     * <td>Determine specified count's composition string character.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CLEARALL</b></td>
     * <td>4</td>
     * <td>Clear all composition strings.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CARETLEFT</b></td>
     * <td>6</td>
     * <td>Move character caret to the left.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CARETRIGHT</b></td>
     * <td>7</td>
     * <td>Move character caret to the right.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CARETTOP</b></td>
     * <td>8</td>
     * <td>Move character caret to the top of the composition string.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CARETBOTTOM</b></td>
     * <td>9</td>
     * <td>Move character caret to the end of the composition string.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CARETBACKSPACE</b></td>
     * <td>10</td>
     * <td>Delete composition string's character before the caret (like the BACKSPACE key).</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_CARETDELETE</b></td>
     * <td>11</td>
     * <td>Delete composition string's character after the caret (like the DELETE key).</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_PHRASEDELETE</b></td>
     * <td>12</td>
     * <td>Delete the composition string's phrase.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_INSERTSPACE</b></td>
     * <td>13</td>
     * <td>Insert a space character—full width or half width depending on the IME configuration.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_INSERTFULLSPACE</b></td>
     * <td>14</td>
     * <td>Insert full width space.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_INSERTHALFSPACE</b></td>
     * <td>15</td>
     * <td>Insert half width space.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_ONIME</b></td>
     * <td>16</td>
     * <td>Set IME ON.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_OFFIME</b></td>
     * <td>17</td>
     * <td>Set IME OFF.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_ONPRECONVERSION</b></td>
     * <td>18</td>
     * <td>Set pre-conversion ON.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_OFFPRECONVERSION</b></td>
     * <td>19</td>
     * <td>Set pre-conversion OFF.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPADCTRL_PHONETICCANDIDATE</b></td>
     * <td>20</td>
     * <td>Open IME's candidate.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <h3><a id="Possible_IPAWS___values"></a><a id="possible_ipaws___values"></a><a id="POSSIBLE_IPAWS___VALUES"></a>Possible <b>IPAWS_*</b> values</h3>
     * These are the possible values that can be received via <i>wParam</i> when <i>reqId</i> is set to <b>IMEPADREQ_GETAPPLETUISTYLE</b>, or that    <i>wParam</i> can be set to when <i>reqId</i> is set to <b>IMEPADREQ_SETAPPLETUISTYLE</b>:<table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>IPAWS_ENABLED</b></td>
     * <td>Show the applet as an enabled window.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_SIZINGNOTIFY</b></td>
     * <td>Send the <b>IMEPN_SIZECHANGING</b> or <b>IMEPN_SIZECHANGED</b> notify code to the applet.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_VERTICALFIXED</b></td>
     * <td>Vertically fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_HORIZONTALFIXED</b></td>
     * <td>Horizontally fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_SIZEFIXED</b></td>
     * <td>Size is fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_MAXWIDTHFIXED</b></td>
     * <td>Max width  is fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_MAXHEIGHTFIXED</b></td>
     * <td>Max height is fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_MAXSIZEFIXED</b></td>
     * <td>Max size is fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_MINWIDTHFIXED</b></td>
     * <td>Min width  is fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_MINHEIGHTFIXED</b></td>
     * <td>Min height is fixed.</td>
     * </tr>
     * <tr>
     * <td><b>IPAWS_MINSIZEFIXED</b></td>
     * <td>Min size is fixed.</td>
     * </tr>
     * </table>
     * @param {IImePadApplet} pIImePadApplet The interface pointer of the calling applet.
     * @param {Integer} reqId 
     * @param {WPARAM} wParam Additional information specific to <i>reqId</i>.
     * @param {LPARAM} lParam Additional information specific to <i>reqId</i>.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepad-request
     */
    Request(pIImePadApplet, reqId, wParam, lParam) {
        result := ComCall(3, this, "ptr", pIImePadApplet, "int", reqId, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
