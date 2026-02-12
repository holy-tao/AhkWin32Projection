#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElementStatics
     * @type {Guid}
     */
    static IID => Guid("{48383032-fbeb-4f8a-aed2-ee21fb27a57b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TagProperty", "get_LanguageProperty", "get_ActualWidthProperty", "get_ActualHeightProperty", "get_WidthProperty", "get_HeightProperty", "get_MinWidthProperty", "get_MaxWidthProperty", "get_MinHeightProperty", "get_MaxHeightProperty", "get_HorizontalAlignmentProperty", "get_VerticalAlignmentProperty", "get_MarginProperty", "get_NameProperty", "get_DataContextProperty", "get_StyleProperty", "get_FlowDirectionProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TagProperty {
        get => this.get_TagProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LanguageProperty {
        get => this.get_LanguageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ActualWidthProperty {
        get => this.get_ActualWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ActualHeightProperty {
        get => this.get_ActualHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    WidthProperty {
        get => this.get_WidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeightProperty {
        get => this.get_HeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinWidthProperty {
        get => this.get_MinWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxWidthProperty {
        get => this.get_MaxWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinHeightProperty {
        get => this.get_MinHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxHeightProperty {
        get => this.get_MaxHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalAlignmentProperty {
        get => this.get_HorizontalAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalAlignmentProperty {
        get => this.get_VerticalAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MarginProperty {
        get => this.get_MarginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NameProperty {
        get => this.get_NameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DataContextProperty {
        get => this.get_DataContextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StyleProperty {
        get => this.get_StyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FlowDirectionProperty {
        get => this.get_FlowDirectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TagProperty() {
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
    get_LanguageProperty() {
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
    get_ActualWidthProperty() {
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
    get_ActualHeightProperty() {
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
    get_WidthProperty() {
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
    get_HeightProperty() {
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
    get_MinWidthProperty() {
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
    get_MaxWidthProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MinHeightProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MaxHeightProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalAlignmentProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalAlignmentProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MarginProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NameProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DataContextProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StyleProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FlowDirectionProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
