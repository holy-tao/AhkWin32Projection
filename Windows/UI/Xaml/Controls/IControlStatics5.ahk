#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlStatics5
     * @type {Guid}
     */
    static IID => Guid("{f635b5a3-ef8e-404f-877b-5580473710a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultStyleResourceUriProperty", "get_IsTemplateKeyTipTargetProperty", "GetIsTemplateKeyTipTarget", "SetIsTemplateKeyTipTarget"]

    /**
     * @type {DependencyProperty} 
     */
    DefaultStyleResourceUriProperty {
        get => this.get_DefaultStyleResourceUriProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTemplateKeyTipTargetProperty {
        get => this.get_IsTemplateKeyTipTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DefaultStyleResourceUriProperty() {
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
    get_IsTemplateKeyTipTargetProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsTemplateKeyTipTarget(element) {
        result := ComCall(8, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsTemplateKeyTipTarget(element, value) {
        result := ComCall(9, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
