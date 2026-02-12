#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IContentThemeTransitionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentThemeTransitionStatics
     * @type {Guid}
     */
    static IID => Guid("{0e8ee385-9a42-4459-afa9-337dc41e1587}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalOffsetProperty", "get_VerticalOffsetProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HorizontalOffsetProperty {
        get => this.get_HorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalOffsetProperty {
        get => this.get_VerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalOffsetProperty() {
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
    get_VerticalOffsetProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
