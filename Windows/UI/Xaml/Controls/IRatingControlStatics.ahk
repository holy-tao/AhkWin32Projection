#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRatingControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatingControlStatics
     * @type {Guid}
     */
    static IID => Guid("{d062d399-ad85-4c1c-b2c4-35dd4432275e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CaptionProperty", "get_InitialSetValueProperty", "get_IsClearEnabledProperty", "get_IsReadOnlyProperty", "get_MaxRatingProperty", "get_PlaceholderValueProperty", "get_ItemInfoProperty", "get_ValueProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CaptionProperty {
        get => this.get_CaptionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    InitialSetValueProperty {
        get => this.get_InitialSetValueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsClearEnabledProperty {
        get => this.get_IsClearEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsReadOnlyProperty {
        get => this.get_IsReadOnlyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxRatingProperty {
        get => this.get_MaxRatingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderValueProperty {
        get => this.get_PlaceholderValueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemInfoProperty {
        get => this.get_ItemInfoProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ValueProperty {
        get => this.get_ValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CaptionProperty() {
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
    get_InitialSetValueProperty() {
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
    get_IsClearEnabledProperty() {
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
    get_IsReadOnlyProperty() {
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
    get_MaxRatingProperty() {
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
    get_PlaceholderValueProperty() {
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
    get_ItemInfoProperty() {
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
    get_ValueProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
