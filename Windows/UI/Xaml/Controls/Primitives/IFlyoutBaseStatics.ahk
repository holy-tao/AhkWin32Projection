#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include .\FlyoutBase.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBaseStatics
     * @type {Guid}
     */
    static IID => Guid("{e2d795e3-85c0-4de2-bac1-5294ca011a78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlacementProperty", "get_AttachedFlyoutProperty", "GetAttachedFlyout", "SetAttachedFlyout", "ShowAttachedFlyout"]

    /**
     * @type {DependencyProperty} 
     */
    PlacementProperty {
        get => this.get_PlacementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AttachedFlyoutProperty {
        get => this.get_AttachedFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlacementProperty() {
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
    get_AttachedFlyoutProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @returns {FlyoutBase} 
     */
    GetAttachedFlyout(element) {
        result := ComCall(8, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlyoutBase(result_)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    SetAttachedFlyout(element, value) {
        result := ComCall(9, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {FrameworkElement} flyoutOwner 
     * @returns {HRESULT} 
     */
    ShowAttachedFlyout(flyoutOwner) {
        result := ComCall(10, this, "ptr", flyoutOwner, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
