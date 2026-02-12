#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IGlyphsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlyphsStatics
     * @type {Guid}
     */
    static IID => Guid("{225cf4c5-fdf1-43ed-958f-414e86f103f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnicodeStringProperty", "get_IndicesProperty", "get_FontUriProperty", "get_StyleSimulationsProperty", "get_FontRenderingEmSizeProperty", "get_OriginXProperty", "get_OriginYProperty", "get_FillProperty"]

    /**
     * @type {DependencyProperty} 
     */
    UnicodeStringProperty {
        get => this.get_UnicodeStringProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IndicesProperty {
        get => this.get_IndicesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontUriProperty {
        get => this.get_FontUriProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StyleSimulationsProperty {
        get => this.get_StyleSimulationsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontRenderingEmSizeProperty {
        get => this.get_FontRenderingEmSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OriginXProperty {
        get => this.get_OriginXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OriginYProperty {
        get => this.get_OriginYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FillProperty {
        get => this.get_FillProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_UnicodeStringProperty() {
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
    get_IndicesProperty() {
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
    get_FontUriProperty() {
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
    get_StyleSimulationsProperty() {
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
    get_FontRenderingEmSizeProperty() {
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
    get_OriginXProperty() {
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
    get_OriginYProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FillProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
