#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IThumbStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbStatics
     * @type {Guid}
     */
    static IID => Guid("{955024eb-36f3-4672-a186-baaf626ac4ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDraggingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsDraggingProperty {
        get => this.get_IsDraggingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsDraggingProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
