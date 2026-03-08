#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPSkinManager interface provides a method used to synchronize the current skin with the current desktop theme in Microsoft Windows XP.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpskinmanager
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSkinManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSkinManager
     * @type {Guid}
     */
    static IID => Guid("{076f2fa6-ed30-448b-8cc5-3f3ef3529c7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVisualStyle"]

    /**
     * The SetVisualStyle method specifies the path to a theme file in Windows XP to which Windows Media Player synchronizes the skin.
     * @remarks
     * Windows XP calls this method when the user changes the current theme. The current skin selection will change to match the theme, or will change to the Windows Classic skin if there is no skin that matches the current theme. If Windows Media Player is in skin mode, the skin will change immediately. Otherwise, the new skin selection will be applied the next time skin mode is entered.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BSTR} bstrPath <b>BSTR</b> containing the path to the theme file.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpskinmanager-setvisualstyle
     */
    SetVisualStyle(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(3, this, "ptr", bstrPath, "HRESULT")
        return result
    }
}
