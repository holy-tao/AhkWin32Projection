#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarPenButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarPenButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{b922ce42-09f0-453d-8026-44daf2753f65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaletteProperty", "get_MinStrokeWidthProperty", "get_MaxStrokeWidthProperty", "get_SelectedBrushProperty", "get_SelectedBrushIndexProperty", "get_SelectedStrokeWidthProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PaletteProperty {
        get => this.get_PaletteProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinStrokeWidthProperty {
        get => this.get_MinStrokeWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxStrokeWidthProperty {
        get => this.get_MaxStrokeWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedBrushProperty {
        get => this.get_SelectedBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedBrushIndexProperty {
        get => this.get_SelectedBrushIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedStrokeWidthProperty {
        get => this.get_SelectedStrokeWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PaletteProperty() {
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
    get_MinStrokeWidthProperty() {
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
    get_MaxStrokeWidthProperty() {
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
    get_SelectedBrushProperty() {
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
    get_SelectedBrushIndexProperty() {
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
    get_SelectedStrokeWidthProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
