#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlStatics6
     * @type {Guid}
     */
    static IID => Guid("{3ccfdd7f-24d1-40a2-8351-b3063a8c95a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LayersProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LayersProperty {
        get => this.get_LayersProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LayersProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
