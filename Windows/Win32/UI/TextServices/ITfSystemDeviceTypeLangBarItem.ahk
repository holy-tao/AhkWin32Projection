#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSystemDeviceTypeLangBarItem interface is implemented by a system language bar item and used by an application or text service to control how the system item displays its icon.
 * @remarks
 * 
 * Support for this interface is optional and must not be assumed.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itfsystemdevicetypelangbaritem
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSystemDeviceTypeLangBarItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSystemDeviceTypeLangBarItem
     * @type {Guid}
     */
    static IID => Guid("{45672eb9-9059-46a2-838d-4530355f6a77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIconMode", "GetIconMode"]

    /**
     * ITfSystemDeviceTypeLangBarItem::SetIconMode method
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system language bar item does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-seticonmode
     */
    SetIconMode(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfSystemDeviceTypeLangBarItem::GetIconMode method
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the current icon display mode for a system language bar item. For more information about possible values, see the dwFlags parameter in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-seticonmode">ITfSystemDeviceTypeLangBarItem::SetIconMode</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-geticonmode
     */
    GetIconMode() {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
