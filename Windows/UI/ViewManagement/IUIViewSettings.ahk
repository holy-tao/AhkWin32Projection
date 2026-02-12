#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UIViewSettings](/uwp/api/Windows.UI.ViewManagement.UIViewSettings) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/uiviewsettingsinterop/nn-uiviewsettingsinterop-iuiviewsettingsinterop
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUIViewSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIViewSettings
     * @type {Guid}
     */
    static IID => Guid("{c63657f6-8850-470d-88f8-455e16ea2c26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserInteractionMode"]

    /**
     * @type {Integer} 
     */
    UserInteractionMode {
        get => this.get_UserInteractionMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserInteractionMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
