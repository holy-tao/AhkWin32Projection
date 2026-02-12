#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRatingItemFontInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatingItemFontInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{fb214f01-6434-4eeb-82ff-7ce5d40bf510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisabledGlyphProperty", "get_GlyphProperty", "get_PlaceholderGlyphProperty", "get_PointerOverGlyphProperty", "get_PointerOverPlaceholderGlyphProperty", "get_UnsetGlyphProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DisabledGlyphProperty {
        get => this.get_DisabledGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GlyphProperty {
        get => this.get_GlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderGlyphProperty {
        get => this.get_PlaceholderGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverGlyphProperty {
        get => this.get_PointerOverGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverPlaceholderGlyphProperty {
        get => this.get_PointerOverPlaceholderGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    UnsetGlyphProperty {
        get => this.get_UnsetGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DisabledGlyphProperty() {
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
    get_GlyphProperty() {
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
    get_PlaceholderGlyphProperty() {
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
    get_PointerOverGlyphProperty() {
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
    get_PointerOverPlaceholderGlyphProperty() {
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
    get_UnsetGlyphProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
