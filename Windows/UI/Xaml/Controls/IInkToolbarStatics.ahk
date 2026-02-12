#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarStatics
     * @type {Guid}
     */
    static IID => Guid("{a3b493bb-cb4f-4e6b-a33d-f11e7a295efa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialControlsProperty", "get_ChildrenProperty", "get_ActiveToolProperty", "get_InkDrawingAttributesProperty", "get_IsRulerButtonCheckedProperty", "get_TargetInkCanvasProperty"]

    /**
     * @type {DependencyProperty} 
     */
    InitialControlsProperty {
        get => this.get_InitialControlsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ChildrenProperty {
        get => this.get_ChildrenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ActiveToolProperty {
        get => this.get_ActiveToolProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    InkDrawingAttributesProperty {
        get => this.get_InkDrawingAttributesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRulerButtonCheckedProperty {
        get => this.get_IsRulerButtonCheckedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TargetInkCanvasProperty {
        get => this.get_TargetInkCanvasProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_InitialControlsProperty() {
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
    get_ChildrenProperty() {
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
    get_ActiveToolProperty() {
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
    get_InkDrawingAttributesProperty() {
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
    get_IsRulerButtonCheckedProperty() {
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
    get_TargetInkCanvasProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
