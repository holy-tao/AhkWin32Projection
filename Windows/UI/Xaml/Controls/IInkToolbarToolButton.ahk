#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarToolButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarToolButton
     * @type {Guid}
     */
    static IID => Guid("{5c5af41e-ccb7-4458-8064-a9849d31561b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ToolKind", "get_IsExtensionGlyphShown", "put_IsExtensionGlyphShown"]

    /**
     * @type {Integer} 
     */
    ToolKind {
        get => this.get_ToolKind()
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
    get_ToolKind() {
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
