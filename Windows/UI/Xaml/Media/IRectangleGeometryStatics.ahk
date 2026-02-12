#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IRectangleGeometryStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRectangleGeometryStatics
     * @type {Guid}
     */
    static IID => Guid("{377f8dba-7902-48e3-83be-7c8002a6653c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RectProperty"]

    /**
     * @type {DependencyProperty} 
     */
    RectProperty {
        get => this.get_RectProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RectProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
