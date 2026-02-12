#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Thickness.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewItemTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewItemTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{ec323744-de31-4936-bfc2-1cb37ba1dc08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExpandedGlyphVisibility", "get_CollapsedGlyphVisibility", "get_Indentation", "get_DragItemsCount"]

    /**
     * @type {Integer} 
     */
    ExpandedGlyphVisibility {
        get => this.get_ExpandedGlyphVisibility()
    }

    /**
     * @type {Integer} 
     */
    CollapsedGlyphVisibility {
        get => this.get_CollapsedGlyphVisibility()
    }

    /**
     * @type {Thickness} 
     */
    Indentation {
        get => this.get_Indentation()
    }

    /**
     * @type {Integer} 
     */
    DragItemsCount {
        get => this.get_DragItemsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpandedGlyphVisibility() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollapsedGlyphVisibility() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Indentation() {
        value := Thickness()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragItemsCount() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
