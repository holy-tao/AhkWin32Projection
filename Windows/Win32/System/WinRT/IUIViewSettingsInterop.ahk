#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiviewsettingsinterop/nn-uiviewsettingsinterop-iuiviewsettingsinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IUIViewSettingsInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIViewSettingsInterop
     * @type {Guid}
     */
    static IID => Guid("{3694dbf9-8f68-44be-8ff5-195c98ede8a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiviewsettingsinterop/nf-uiviewsettingsinterop-iuiviewsettingsinterop-getforwindow
     */
    GetForWindow(hwnd, riid, ppv) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", hwnd, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
