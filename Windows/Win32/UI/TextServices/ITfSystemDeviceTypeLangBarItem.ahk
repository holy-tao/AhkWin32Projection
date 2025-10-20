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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetIconMode(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetIconMode(pdwFlags) {
        result := ComCall(4, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
