#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileNotification extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileNotification
     * @type {Guid}
     */
    static IID => Guid("{ebaec8fa-50ec-4c18-b4d0-3af02e5540ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_ExpirationTime", "get_ExpirationTime", "put_Tag", "get_Tag"]

    /**
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

    /**
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
