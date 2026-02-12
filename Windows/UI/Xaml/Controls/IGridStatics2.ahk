#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGridStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridStatics2
     * @type {Guid}
     */
    static IID => Guid("{2d666658-58b6-4a1b-841b-875ba93b5d6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BorderBrushProperty", "get_BorderThicknessProperty", "get_CornerRadiusProperty", "get_PaddingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BorderBrushProperty {
        get => this.get_BorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BorderThicknessProperty {
        get => this.get_BorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CornerRadiusProperty {
        get => this.get_CornerRadiusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaddingProperty {
        get => this.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BorderBrushProperty() {
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
    get_BorderThicknessProperty() {
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
    get_CornerRadiusProperty() {
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
    get_PaddingProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
