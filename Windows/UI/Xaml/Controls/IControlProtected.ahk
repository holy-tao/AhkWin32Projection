#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlProtected
     * @type {Guid}
     */
    static IID => Guid("{1791587a-2a7c-4981-a2d8-ab99fffc65b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultStyleKey", "put_DefaultStyleKey", "GetTemplateChild"]

    /**
     * @type {IInspectable} 
     */
    DefaultStyleKey {
        get => this.get_DefaultStyleKey()
        set => this.put_DefaultStyleKey(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DefaultStyleKey() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_DefaultStyleKey(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} childName 
     * @returns {DependencyObject} 
     */
    GetTemplateChild(childName) {
        if(childName is String) {
            pin := HSTRING.Create(childName)
            childName := pin.Value
        }
        childName := childName is Win32Handle ? NumGet(childName, "ptr") : childName

        result := ComCall(8, this, "ptr", childName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }
}
