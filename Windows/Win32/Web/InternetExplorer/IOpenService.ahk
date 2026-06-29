#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class IOpenService extends IUnknown {

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
     * IsDefault
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-isdefault
     */
    IsDefault() {
        result := ComCall(3, this, "int*", &pfIsDefault := 0, "HRESULT")
        return pfIsDefault
    }

    /**
     * 
     * @param {BOOL} fDefault 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    SetDefault(fDefault, _hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(4, this, "int", fDefault, "ptr", _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetID() {
        pbstrID := BSTR({Value: 0}, True)
        result := ComCall(5, this, "ptr", pbstrID, "HRESULT")
        return pbstrID
    }
}
