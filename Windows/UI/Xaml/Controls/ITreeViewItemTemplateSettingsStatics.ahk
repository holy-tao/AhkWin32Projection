#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewItemTemplateSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewItemTemplateSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{55c720a8-70ed-4c21-93f4-2d79c1a4a5f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExpandedGlyphVisibilityProperty", "get_CollapsedGlyphVisibilityProperty", "get_IndentationProperty", "get_DragItemsCountProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ExpandedGlyphVisibilityProperty {
        get => this.get_ExpandedGlyphVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CollapsedGlyphVisibilityProperty {
        get => this.get_CollapsedGlyphVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IndentationProperty {
        get => this.get_IndentationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DragItemsCountProperty {
        get => this.get_DragItemsCountProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExpandedGlyphVisibilityProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CollapsedGlyphVisibilityProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IndentationProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DragItemsCountProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
