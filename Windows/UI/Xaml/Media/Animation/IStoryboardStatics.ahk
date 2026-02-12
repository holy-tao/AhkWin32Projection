#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IStoryboardStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoryboardStatics
     * @type {Guid}
     */
    static IID => Guid("{d82f07d8-73d5-4379-bd48-7e05184a8bad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetPropertyProperty", "GetTargetProperty", "SetTargetProperty", "get_TargetNameProperty", "GetTargetName", "SetTargetName", "SetTarget"]

    /**
     * @type {DependencyProperty} 
     */
    TargetPropertyProperty {
        get => this.get_TargetPropertyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TargetNameProperty {
        get => this.get_TargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TargetPropertyProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {Timeline} element 
     * @returns {HSTRING} 
     */
    GetTargetProperty(element) {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Timeline} element 
     * @param {HSTRING} path_ 
     * @returns {HRESULT} 
     */
    SetTargetProperty(element, path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(8, this, "ptr", element, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TargetNameProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {Timeline} element 
     * @returns {HSTRING} 
     */
    GetTargetName(element) {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Timeline} element 
     * @param {HSTRING} name 
     * @returns {HRESULT} 
     */
    SetTargetName(element, name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", element, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Timeline} timeline_ 
     * @param {DependencyObject} target 
     * @returns {HRESULT} 
     */
    SetTarget(timeline_, target) {
        result := ComCall(12, this, "ptr", timeline_, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
