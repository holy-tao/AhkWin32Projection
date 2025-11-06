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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-seticonmode
     */
    SetIconMode(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-geticonmode
     */
    GetIconMode() {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
