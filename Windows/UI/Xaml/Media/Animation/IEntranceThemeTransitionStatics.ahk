#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEntranceThemeTransitionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEntranceThemeTransitionStatics
     * @type {Guid}
     */
    static IID => Guid("{37cc0577-ff98-4aed-b86e-5ec23702f877}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FromHorizontalOffsetProperty", "get_FromVerticalOffsetProperty", "get_IsStaggeringEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FromHorizontalOffsetProperty {
        get => this.get_FromHorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FromVerticalOffsetProperty {
        get => this.get_FromVerticalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsStaggeringEnabledProperty {
        get => this.get_IsStaggeringEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FromHorizontalOffsetProperty() {
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
    get_FromVerticalOffsetProperty() {
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
    get_IsStaggeringEnabledProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
