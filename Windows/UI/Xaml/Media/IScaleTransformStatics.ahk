#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IScaleTransformStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScaleTransformStatics
     * @type {Guid}
     */
    static IID => Guid("{9d9436f4-40a7-46dd-975a-07d337cd852e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CenterXProperty", "get_CenterYProperty", "get_ScaleXProperty", "get_ScaleYProperty"]

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
}
