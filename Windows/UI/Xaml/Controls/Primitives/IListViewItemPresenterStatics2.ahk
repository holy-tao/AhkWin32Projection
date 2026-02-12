#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IListViewItemPresenterStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemPresenterStatics2
     * @type {Guid}
     */
    static IID => Guid("{4cb3b945-d24d-42a3-9e83-a86d0618bf1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedPressedBackgroundProperty", "get_PressedBackgroundProperty", "get_CheckBoxBrushProperty", "get_FocusSecondaryBorderBrushProperty", "get_CheckModeProperty", "get_PointerOverForegroundProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectedPressedBackgroundProperty {
        get => this.get_SelectedPressedBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PressedBackgroundProperty {
        get => this.get_PressedBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxBrushProperty {
        get => this.get_CheckBoxBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FocusSecondaryBorderBrushProperty {
        get => this.get_FocusSecondaryBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckModeProperty {
        get => this.get_CheckModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverForegroundProperty {
        get => this.get_PointerOverForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedPressedBackgroundProperty() {
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
    get_PressedBackgroundProperty() {
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
    get_CheckBoxBrushProperty() {
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
    get_FocusSecondaryBorderBrushProperty() {
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
    get_CheckModeProperty() {
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
    get_PointerOverForegroundProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
