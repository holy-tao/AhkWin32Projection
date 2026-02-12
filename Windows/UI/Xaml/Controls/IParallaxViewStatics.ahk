#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IParallaxViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParallaxViewStatics
     * @type {Guid}
     */
    static IID => Guid("{8836e49c-0e0e-57d8-9395-f0a9a0d1bb28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChildProperty", "get_HorizontalSourceEndOffsetProperty", "get_HorizontalSourceOffsetKindProperty", "get_HorizontalSourceStartOffsetProperty", "get_MaxHorizontalShiftRatioProperty", "get_HorizontalShiftProperty", "get_IsHorizontalShiftClampedProperty", "get_IsVerticalShiftClampedProperty", "get_SourceProperty", "get_VerticalSourceEndOffsetProperty", "get_VerticalSourceOffsetKindProperty", "get_VerticalSourceStartOffsetProperty", "get_MaxVerticalShiftRatioProperty", "get_VerticalShiftProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ChildProperty {
        get => this.get_ChildProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalSourceEndOffsetProperty {
        get => this.get_HorizontalSourceEndOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalSourceOffsetKindProperty {
        get => this.get_HorizontalSourceOffsetKindProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalSourceStartOffsetProperty {
        get => this.get_HorizontalSourceStartOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxHorizontalShiftRatioProperty {
        get => this.get_MaxHorizontalShiftRatioProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalShiftProperty {
        get => this.get_HorizontalShiftProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHorizontalShiftClampedProperty {
        get => this.get_IsHorizontalShiftClampedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsVerticalShiftClampedProperty {
        get => this.get_IsVerticalShiftClampedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SourceProperty {
        get => this.get_SourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalSourceEndOffsetProperty {
        get => this.get_VerticalSourceEndOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalSourceOffsetKindProperty {
        get => this.get_VerticalSourceOffsetKindProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalSourceStartOffsetProperty {
        get => this.get_VerticalSourceStartOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxVerticalShiftRatioProperty {
        get => this.get_MaxVerticalShiftRatioProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalShiftProperty {
        get => this.get_VerticalShiftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ChildProperty() {
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
    get_HorizontalSourceEndOffsetProperty() {
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
    get_HorizontalSourceOffsetKindProperty() {
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
    get_HorizontalSourceStartOffsetProperty() {
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
    get_MaxHorizontalShiftRatioProperty() {
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
    get_HorizontalShiftProperty() {
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
    get_IsHorizontalShiftClampedProperty() {
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
    get_IsVerticalShiftClampedProperty() {
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
    get_SourceProperty() {
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
    get_VerticalSourceEndOffsetProperty() {
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
    get_VerticalSourceOffsetKindProperty() {
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
    get_VerticalSourceStartOffsetProperty() {
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
    get_MaxVerticalShiftRatioProperty() {
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
    get_VerticalShiftProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
