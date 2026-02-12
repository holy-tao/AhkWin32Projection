#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics4
     * @type {Guid}
     */
    static IID => Guid("{f7d62655-311a-4b7c-a131-524e89cd3cf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LandmarkTypeProperty", "GetLandmarkType", "SetLandmarkType", "get_LocalizedLandmarkTypeProperty", "GetLocalizedLandmarkType", "SetLocalizedLandmarkType"]

    /**
     * @type {DependencyProperty} 
     */
    LandmarkTypeProperty {
        get => this.get_LandmarkTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LocalizedLandmarkTypeProperty {
        get => this.get_LocalizedLandmarkTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LandmarkTypeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetLandmarkType(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetLandmarkType(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LocalizedLandmarkTypeProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetLocalizedLandmarkType(element) {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetLocalizedLandmarkType(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
