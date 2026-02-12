#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGradientBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGradientBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{961661f9-8bb4-4e6c-b923-b5d787e0f1a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SpreadMethodProperty", "get_MappingModeProperty", "get_ColorInterpolationModeProperty", "get_GradientStopsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SpreadMethodProperty {
        get => this.get_SpreadMethodProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MappingModeProperty {
        get => this.get_MappingModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColorInterpolationModeProperty {
        get => this.get_ColorInterpolationModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GradientStopsProperty {
        get => this.get_GradientStopsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SpreadMethodProperty() {
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
    get_MappingModeProperty() {
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
    get_ColorInterpolationModeProperty() {
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
    get_GradientStopsProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
