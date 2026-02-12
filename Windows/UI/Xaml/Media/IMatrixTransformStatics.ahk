#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IMatrixTransformStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMatrixTransformStatics
     * @type {Guid}
     */
    static IID => Guid("{43e02e47-15b8-4758-bb97-7d52420acc5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MatrixProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MatrixProperty {
        get => this.get_MatrixProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MatrixProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
