#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapElementsLayerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapElementsLayerStatics
     * @type {Guid}
     */
    static IID => Guid("{34005727-f509-4d28-9180-911c03411d74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MapElementsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MapElementsProperty {
        get => this.get_MapElementsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapElementsProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
