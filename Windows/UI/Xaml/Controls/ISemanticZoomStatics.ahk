#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISemanticZoomStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticZoomStatics
     * @type {Guid}
     */
    static IID => Guid("{8ef17ef2-9898-4666-b285-3ed38a07910e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ZoomedInViewProperty", "get_ZoomedOutViewProperty", "get_IsZoomedInViewActiveProperty", "get_CanChangeViewsProperty", "get_IsZoomOutButtonEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ZoomedInViewProperty {
        get => this.get_ZoomedInViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomedOutViewProperty {
        get => this.get_ZoomedOutViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomedInViewActiveProperty {
        get => this.get_IsZoomedInViewActiveProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanChangeViewsProperty {
        get => this.get_CanChangeViewsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomOutButtonEnabledProperty {
        get => this.get_IsZoomOutButtonEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomedInViewProperty() {
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
    get_ZoomedOutViewProperty() {
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
    get_IsZoomedInViewActiveProperty() {
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
    get_CanChangeViewsProperty() {
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
    get_IsZoomOutButtonEnabledProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
