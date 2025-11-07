#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenService
     * @type {Guid}
     */
    static IID => Guid("{c2952ed1-6a89-4606-925f-1ed8b4be0630}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDefault", "SetDefault", "GetID"]

    /**
     * 
     * @returns {BOOL} 
     */
    IsDefault() {
        result := ComCall(3, this, "int*", &pfIsDefault := 0, "HRESULT")
        return pfIsDefault
    }

    /**
     * 
     * @param {BOOL} fDefault 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetDefault(fDefault, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "int", fDefault, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetID() {
        pbstrID := BSTR()
        result := ComCall(5, this, "ptr", pbstrID, "HRESULT")
        return pbstrID
    }
}
