#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include .\IDataTemplateExtension.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDataTemplateStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplateStatics2
     * @type {Guid}
     */
    static IID => Guid("{8af77d73-aa01-471e-bedd-8bad86219b77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtensionInstanceProperty", "GetExtensionInstance", "SetExtensionInstance"]

    /**
     * @type {DependencyProperty} 
     */
    ExtensionInstanceProperty {
        get => this.get_ExtensionInstanceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExtensionInstanceProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @returns {IDataTemplateExtension} 
     */
    GetExtensionInstance(element) {
        result := ComCall(7, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDataTemplateExtension(result_)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @param {IDataTemplateExtension} value 
     * @returns {HRESULT} 
     */
    SetExtensionInstance(element, value) {
        result := ComCall(8, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
