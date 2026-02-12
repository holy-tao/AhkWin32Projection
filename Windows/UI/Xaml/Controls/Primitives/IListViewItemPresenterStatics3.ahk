#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IListViewItemPresenterStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemPresenterStatics3
     * @type {Guid}
     */
    static IID => Guid("{c3d3d11e-fa26-4ce7-a4ed-ff948f01b7c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RevealBackgroundProperty", "get_RevealBorderBrushProperty", "get_RevealBorderThicknessProperty", "get_RevealBackgroundShowsAboveContentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    RevealBackgroundProperty {
        get => this.get_RevealBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RevealBorderBrushProperty {
        get => this.get_RevealBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RevealBorderThicknessProperty {
        get => this.get_RevealBorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RevealBackgroundShowsAboveContentProperty {
        get => this.get_RevealBackgroundShowsAboveContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RevealBackgroundProperty() {
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
    get_RevealBorderBrushProperty() {
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
    get_RevealBorderThicknessProperty() {
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
    get_RevealBackgroundShowsAboveContentProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
