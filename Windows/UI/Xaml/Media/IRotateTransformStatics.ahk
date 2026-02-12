#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IRotateTransformStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRotateTransformStatics
     * @type {Guid}
     */
    static IID => Guid("{a131eb8a-51a3-41b6-b9d3-a10e429054ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CenterXProperty", "get_CenterYProperty", "get_AngleProperty"]

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
    AngleProperty {
        get => this.get_AngleProperty()
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
    get_AngleProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
