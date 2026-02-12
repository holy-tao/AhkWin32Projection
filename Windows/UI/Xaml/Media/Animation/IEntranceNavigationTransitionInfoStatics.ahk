#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEntranceNavigationTransitionInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEntranceNavigationTransitionInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{f948c27a-40c9-469f-8f33-bf45c8811f21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTargetElementProperty", "GetIsTargetElement", "SetIsTargetElement"]

    /**
     * @type {DependencyProperty} 
     */
    IsTargetElementProperty {
        get => this.get_IsTargetElementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTargetElementProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetIsTargetElement(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsTargetElement(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
