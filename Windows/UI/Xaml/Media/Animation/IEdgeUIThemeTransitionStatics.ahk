#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEdgeUIThemeTransitionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEdgeUIThemeTransitionStatics
     * @type {Guid}
     */
    static IID => Guid("{16a2b13b-4705-302b-27c6-2aac92f645ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EdgeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EdgeProperty {
        get => this.get_EdgeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EdgeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
