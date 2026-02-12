#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class ICompositeTransform3DStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositeTransform3DStatics
     * @type {Guid}
     */
    static IID => Guid("{ddbf4d67-2a25-48f3-9808-c51ec3d55bec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CenterXProperty", "get_CenterYProperty", "get_CenterZProperty", "get_RotationXProperty", "get_RotationYProperty", "get_RotationZProperty", "get_ScaleXProperty", "get_ScaleYProperty", "get_ScaleZProperty", "get_TranslateXProperty", "get_TranslateYProperty", "get_TranslateZProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CenterXProperty {
        get => this.get_CenterXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CenterYProperty {
        get => this.get_CenterYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CenterZProperty {
        get => this.get_CenterZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationXProperty {
        get => this.get_RotationXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationYProperty {
        get => this.get_RotationYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationZProperty {
        get => this.get_RotationZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ScaleXProperty {
        get => this.get_ScaleXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ScaleYProperty {
        get => this.get_ScaleYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ScaleZProperty {
        get => this.get_ScaleZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TranslateXProperty {
        get => this.get_TranslateXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TranslateYProperty {
        get => this.get_TranslateYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TranslateZProperty {
        get => this.get_TranslateZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CenterXProperty() {
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
    get_CenterYProperty() {
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
    get_CenterZProperty() {
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
    get_RotationXProperty() {
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
    get_RotationYProperty() {
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
    get_RotationZProperty() {
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
    get_ScaleXProperty() {
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
    get_ScaleYProperty() {
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
    get_ScaleZProperty() {
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
    get_TranslateXProperty() {
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
    get_TranslateYProperty() {
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
    get_TranslateZProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
