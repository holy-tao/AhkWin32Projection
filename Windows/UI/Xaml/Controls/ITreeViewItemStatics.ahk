#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewItemStatics
     * @type {Guid}
     */
    static IID => Guid("{436795be-7396-46dc-a264-21c56581c5e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GlyphOpacityProperty", "get_GlyphBrushProperty", "get_ExpandedGlyphProperty", "get_CollapsedGlyphProperty", "get_GlyphSizeProperty", "get_IsExpandedProperty", "get_TreeViewItemTemplateSettingsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    GlyphOpacityProperty {
        get => this.get_GlyphOpacityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GlyphBrushProperty {
        get => this.get_GlyphBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExpandedGlyphProperty {
        get => this.get_ExpandedGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CollapsedGlyphProperty {
        get => this.get_CollapsedGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GlyphSizeProperty {
        get => this.get_GlyphSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsExpandedProperty {
        get => this.get_IsExpandedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TreeViewItemTemplateSettingsProperty {
        get => this.get_TreeViewItemTemplateSettingsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GlyphOpacityProperty() {
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
    get_GlyphBrushProperty() {
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
    get_ExpandedGlyphProperty() {
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
    get_CollapsedGlyphProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GlyphSizeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsExpandedProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TreeViewItemTemplateSettingsProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
