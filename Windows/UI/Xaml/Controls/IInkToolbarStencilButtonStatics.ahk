#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarStencilButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarStencilButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{4748c07f-63e4-420d-939a-6b7243e9d124}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RulerProperty", "get_ProtractorProperty", "get_SelectedStencilProperty", "get_IsRulerItemVisibleProperty", "get_IsProtractorItemVisibleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    RulerProperty {
        get => this.get_RulerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ProtractorProperty {
        get => this.get_ProtractorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedStencilProperty {
        get => this.get_SelectedStencilProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRulerItemVisibleProperty {
        get => this.get_IsRulerItemVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsProtractorItemVisibleProperty {
        get => this.get_IsProtractorItemVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RulerProperty() {
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
    get_ProtractorProperty() {
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
    get_SelectedStencilProperty() {
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
    get_IsRulerItemVisibleProperty() {
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
    get_IsProtractorItemVisibleProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
