#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include .\DataTemplateSelector.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\Media\FontFamily.ahk
#Include ..\..\Text\FontWeight.ahk
#Include ..\Media\Brush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenter
     * @type {Guid}
     */
    static IID => Guid("{79fde5b4-cd37-491c-8845-daf472defff6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_Content", "get_ContentTemplate", "put_ContentTemplate", "get_ContentTemplateSelector", "put_ContentTemplateSelector", "get_ContentTransitions", "put_ContentTransitions", "get_FontSize", "put_FontSize", "get_FontFamily", "put_FontFamily", "get_FontWeight", "put_FontWeight", "get_FontStyle", "put_FontStyle", "get_FontStretch", "put_FontStretch", "get_CharacterSpacing", "put_CharacterSpacing", "get_Foreground", "put_Foreground"]

    /**
     * @type {IInspectable} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {DataTemplate} 
     */
    ContentTemplate {
        get => this.get_ContentTemplate()
        set => this.put_ContentTemplate(value)
    }

    /**
     * @type {DataTemplateSelector} 
     */
    ContentTemplateSelector {
        get => this.get_ContentTemplateSelector()
        set => this.put_ContentTemplateSelector(value)
    }

    /**
     * @type {TransitionCollection} 
     */
    ContentTransitions {
        get => this.get_ContentTransitions()
        set => this.put_ContentTransitions(value)
    }

    /**
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ContentTemplate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplate(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ContentTemplateSelector() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplateSelector(value)
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplateSelector(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ContentTransitions() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ContentTransitions(value) {
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
    get_FontSize() {
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
    put_FontSize(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        value := FontWeight()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStretch(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSpacing(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
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
    put_Foreground(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
