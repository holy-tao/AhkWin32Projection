#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/uiviewsettingsinterop/nn-uiviewsettingsinterop-iuiviewsettingsinterop
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
     * Gets an [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object for the window of the active application.
     * @param {HWND} hwnd_ Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(UIViewSettings)`
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiviewsettingsinterop/nf-uiviewsettingsinterop-iuiviewsettingsinterop-getforwindow
     */
    GetForWindow(hwnd_, riid) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(6, this, "ptr", hwnd_, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
