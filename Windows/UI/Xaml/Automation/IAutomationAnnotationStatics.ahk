#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationAnnotationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationAnnotationStatics
     * @type {Guid}
     */
    static IID => Guid("{e503eab7-4ee5-48cb-b5b8-bbcd46c9d1da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TypeProperty", "get_ElementProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TypeProperty {
        get => this.get_TypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ElementProperty {
        get => this.get_ElementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TypeProperty() {
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
    get_ElementProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
