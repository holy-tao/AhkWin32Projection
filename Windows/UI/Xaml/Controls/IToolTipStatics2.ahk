#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IToolTipStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToolTipStatics2
     * @type {Guid}
     */
    static IID => Guid("{6845e646-9c7f-5011-8a78-7da9d87eb3b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlacementRectProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PlacementRectProperty {
        get => this.get_PlacementRectProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlacementRectProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
