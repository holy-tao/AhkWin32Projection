#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPivotStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPivotStatics2
     * @type {Guid}
     */
    static IID => Guid("{d7518add-be75-4023-8deb-c6513c3192a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftHeaderProperty", "get_LeftHeaderTemplateProperty", "get_RightHeaderProperty", "get_RightHeaderTemplateProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LeftHeaderProperty {
        get => this.get_LeftHeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LeftHeaderTemplateProperty {
        get => this.get_LeftHeaderTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RightHeaderProperty {
        get => this.get_RightHeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RightHeaderTemplateProperty {
        get => this.get_RightHeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LeftHeaderProperty() {
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
    get_LeftHeaderTemplateProperty() {
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
    get_RightHeaderProperty() {
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
    get_RightHeaderTemplateProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
