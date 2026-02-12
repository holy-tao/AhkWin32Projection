#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ICompositeTransformStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositeTransformStatics
     * @type {Guid}
     */
    static IID => Guid("{2f190c08-8266-496f-9653-a18bd4f836aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CenterXProperty", "get_CenterYProperty", "get_ScaleXProperty", "get_ScaleYProperty", "get_SkewXProperty", "get_SkewYProperty", "get_RotationProperty", "get_TranslateXProperty", "get_TranslateYProperty"]

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
    SkewXProperty {
        get => this.get_SkewXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SkewYProperty {
        get => this.get_SkewYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationProperty {
        get => this.get_RotationProperty()
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
    get_ScaleXProperty() {
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
    get_ScaleYProperty() {
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
    get_SkewXProperty() {
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
    get_SkewYProperty() {
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
    get_RotationProperty() {
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
    get_TranslateXProperty() {
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
    get_TranslateYProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
