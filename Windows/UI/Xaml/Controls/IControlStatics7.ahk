#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlStatics7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlStatics7
     * @type {Guid}
     */
    static IID => Guid("{aee1ca45-c910-5dab-a266-fdf50c0bedd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundSizingProperty", "get_CornerRadiusProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BackgroundSizingProperty {
        get => this.get_BackgroundSizingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CornerRadiusProperty {
        get => this.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BackgroundSizingProperty() {
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
    get_CornerRadiusProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
