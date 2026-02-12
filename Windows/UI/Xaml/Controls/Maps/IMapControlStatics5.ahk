#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlStatics5
     * @type {Guid}
     */
    static IID => Guid("{09626f00-b7dd-4189-a7f7-830c412deea3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MapProjectionProperty", "get_StyleSheetProperty", "get_ViewPaddingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MapProjectionProperty {
        get => this.get_MapProjectionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StyleSheetProperty {
        get => this.get_StyleSheetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ViewPaddingProperty {
        get => this.get_ViewPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapProjectionProperty() {
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
    get_StyleSheetProperty() {
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
    get_ViewPaddingProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
