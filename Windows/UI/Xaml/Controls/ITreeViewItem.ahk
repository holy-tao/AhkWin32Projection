#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Brush.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TreeViewItemTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewItem
     * @type {Guid}
     */
    static IID => Guid("{4e05d3e6-6167-44e7-9c74-291ddd6df6eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GlyphOpacity", "put_GlyphOpacity", "get_GlyphBrush", "put_GlyphBrush", "get_ExpandedGlyph", "put_ExpandedGlyph", "get_CollapsedGlyph", "put_CollapsedGlyph", "get_GlyphSize", "put_GlyphSize", "get_IsExpanded", "put_IsExpanded", "get_TreeViewItemTemplateSettings"]

    /**
     * @type {Float} 
     */
    GlyphOpacity {
        get => this.get_GlyphOpacity()
        set => this.put_GlyphOpacity(value)
    }

    /**
     * @type {Brush} 
     */
    GlyphBrush {
        get => this.get_GlyphBrush()
        set => this.put_GlyphBrush(value)
    }

    /**
     * @type {HSTRING} 
     */
    ExpandedGlyph {
        get => this.get_ExpandedGlyph()
        set => this.put_ExpandedGlyph(value)
    }

    /**
     * @type {HSTRING} 
     */
    CollapsedGlyph {
        get => this.get_CollapsedGlyph()
        set => this.put_CollapsedGlyph(value)
    }

    /**
     * @type {Float} 
     */
    GlyphSize {
        get => this.get_GlyphSize()
        set => this.put_GlyphSize(value)
    }

    /**
     * @type {Boolean} 
     */
    IsExpanded {
        get => this.get_IsExpanded()
        set => this.put_IsExpanded(value)
    }

    /**
     * @type {TreeViewItemTemplateSettings} 
     */
    TreeViewItemTemplateSettings {
        get => this.get_TreeViewItemTemplateSettings()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlyphOpacity() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlyphOpacity(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_GlyphBrush() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_GlyphBrush(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExpandedGlyph() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExpandedGlyph(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CollapsedGlyph() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CollapsedGlyph(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlyphSize() {
        result := ComCall(14, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlyphSize(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExpanded() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_IsExpanded(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TreeViewItemTemplateSettings} 
     */
    get_TreeViewItemTemplateSettings() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TreeViewItemTemplateSettings(value)
    }
}
