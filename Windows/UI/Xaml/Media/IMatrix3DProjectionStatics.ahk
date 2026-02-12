#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IMatrix3DProjectionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMatrix3DProjectionStatics
     * @type {Guid}
     */
    static IID => Guid("{ae9d5895-41ec-4e37-abaa-69f41d2f876b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProjectionMatrixProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ProjectionMatrixProperty {
        get => this.get_ProjectionMatrixProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ProjectionMatrixProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
