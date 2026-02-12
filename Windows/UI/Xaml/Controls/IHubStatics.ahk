#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHubStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHubStatics
     * @type {Guid}
     */
    static IID => Guid("{0e6fa034-ad3c-4f32-b701-e24fab562028}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderProperty", "get_HeaderTemplateProperty", "get_OrientationProperty", "get_DefaultSectionIndexProperty", "get_SemanticZoomOwnerProperty", "get_IsActiveViewProperty", "get_IsZoomedInViewProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HeaderProperty {
        get => this.get_HeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderTemplateProperty {
        get => this.get_HeaderTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OrientationProperty {
        get => this.get_OrientationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DefaultSectionIndexProperty {
        get => this.get_DefaultSectionIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SemanticZoomOwnerProperty {
        get => this.get_SemanticZoomOwnerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsActiveViewProperty {
        get => this.get_IsActiveViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomedInViewProperty {
        get => this.get_IsZoomedInViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeaderProperty() {
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
    get_HeaderTemplateProperty() {
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
    get_OrientationProperty() {
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
    get_DefaultSectionIndexProperty() {
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
    get_SemanticZoomOwnerProperty() {
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
    get_IsActiveViewProperty() {
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
    get_IsZoomedInViewProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
