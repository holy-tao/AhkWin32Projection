#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents text, HTML, or XHTML content. This interface encapsulates elements in *RSS 2.0* or *Atom 1.0* that can have either text, HTML, or XHTML content. In *Atom 1.0* this interface maps to an **atomTextConstruct** in the schema, which can be element **atom:title**, **atom:subtitle**, **atom:rights** or **atom:summary**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationtext
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationText extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationText
     * @type {Guid}
     */
    static IID => Guid("{b9cc5e80-313a-4091-a2a6-243e0ee923f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Text", "put_Text", "get_Type", "put_Type", "get_Xml", "put_Xml"]

    /**
     * Gets or sets the content of a text content construct like **atom:title**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationtext.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the type of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationtext.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the XML content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationtext.xml
     * @type {XmlDocument} 
     */
    Xml {
        get => this.get_Xml()
        set => this.put_Xml(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
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
    put_Text(value) {
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
     * @returns {HSTRING} 
     */
    get_Type() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_Type(value) {
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
     * @returns {XmlDocument} 
     */
    get_Xml() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(value)
    }

    /**
     * 
     * @param {XmlDocument} value 
     * @returns {HRESULT} 
     */
    put_Xml(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
