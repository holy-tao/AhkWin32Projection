#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarMenuButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarMenuButton
     * @type {Guid}
     */
    static IID => Guid("{860ecae5-7633-4ea1-a209-50392d1aebd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MenuKind", "get_IsExtensionGlyphShown", "put_IsExtensionGlyphShown"]

    /**
     * @type {Integer} 
     */
    MenuKind {
        get => this.get_MenuKind()
    }

    /**
     * @type {Boolean} 
     */
    IsExtensionGlyphShown {
        get => this.get_IsExtensionGlyphShown()
        set => this.put_IsExtensionGlyphShown(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MenuKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExtensionGlyphShown() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExtensionGlyphShown(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
