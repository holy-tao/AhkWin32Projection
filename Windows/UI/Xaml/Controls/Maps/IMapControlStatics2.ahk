#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlStatics2
     * @type {Guid}
     */
    static IID => Guid("{04852b93-b446-4d31-9752-1ec69a5996ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BusinessLandmarksVisibleProperty", "get_TransitFeaturesVisibleProperty", "get_PanInteractionModeProperty", "get_RotateInteractionModeProperty", "get_TiltInteractionModeProperty", "get_ZoomInteractionModeProperty", "get_Is3DSupportedProperty", "get_IsStreetsideSupportedProperty", "get_SceneProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BusinessLandmarksVisibleProperty {
        get => this.get_BusinessLandmarksVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TransitFeaturesVisibleProperty {
        get => this.get_TransitFeaturesVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PanInteractionModeProperty {
        get => this.get_PanInteractionModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotateInteractionModeProperty {
        get => this.get_RotateInteractionModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TiltInteractionModeProperty {
        get => this.get_TiltInteractionModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomInteractionModeProperty {
        get => this.get_ZoomInteractionModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    Is3DSupportedProperty {
        get => this.get_Is3DSupportedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsStreetsideSupportedProperty {
        get => this.get_IsStreetsideSupportedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SceneProperty {
        get => this.get_SceneProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BusinessLandmarksVisibleProperty() {
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
    get_TransitFeaturesVisibleProperty() {
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
    get_PanInteractionModeProperty() {
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
    get_RotateInteractionModeProperty() {
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
    get_TiltInteractionModeProperty() {
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
    get_ZoomInteractionModeProperty() {
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
    get_Is3DSupportedProperty() {
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
    get_IsStreetsideSupportedProperty() {
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
    get_SceneProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
