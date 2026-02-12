#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapLayerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapLayerStatics
     * @type {Guid}
     */
    static IID => Guid("{9ca4a26b-5db9-4f0c-bdd5-b1bffdcce946}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MapTabIndexProperty", "get_VisibleProperty", "get_ZIndexProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MapTabIndexProperty {
        get => this.get_MapTabIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VisibleProperty {
        get => this.get_VisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZIndexProperty {
        get => this.get_ZIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapTabIndexProperty() {
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
    get_VisibleProperty() {
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
    get_ZIndexProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
