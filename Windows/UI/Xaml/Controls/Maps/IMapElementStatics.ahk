#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapElementStatics
     * @type {Guid}
     */
    static IID => Guid("{e8c71cf2-bfef-4b49-8e99-41b5e3789fd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ZIndexProperty", "get_VisibleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ZIndexProperty {
        get => this.get_ZIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VisibleProperty {
        get => this.get_VisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZIndexProperty() {
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
}
