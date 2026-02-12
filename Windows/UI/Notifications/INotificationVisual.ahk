#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\NotificationBinding.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class INotificationVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotificationVisual
     * @type {Guid}
     */
    static IID => Guid("{68835b8e-aa56-4e11-86d3-5f9a6957bc5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Language", "put_Language", "get_Bindings", "GetBinding"]

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * @type {IVector<NotificationBinding>} 
     */
    Bindings {
        get => this.get_Bindings()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<NotificationBinding>} 
     */
    get_Bindings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(NotificationBinding, value)
    }

    /**
     * 
     * @param {HSTRING} templateName 
     * @returns {NotificationBinding} 
     */
    GetBinding(templateName) {
        if(templateName is String) {
            pin := HSTRING.Create(templateName)
            templateName := pin.Value
        }
        templateName := templateName is Win32Handle ? NumGet(templateName, "ptr") : templateName

        result := ComCall(9, this, "ptr", templateName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NotificationBinding(result_)
    }
}
