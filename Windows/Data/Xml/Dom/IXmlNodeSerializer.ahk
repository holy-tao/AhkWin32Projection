#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Encapsulates the methods needed to serialize a DOM tree or subtree to a string representation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeserializer
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlNodeSerializer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlNodeSerializer
     * @type {Guid}
     */
    static IID => Guid("{5cc5b382-e6dd-4991-abef-06d8d2e7bd0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXml", "get_InnerText", "put_InnerText"]

    /**
     * Gets and sets the text from inside the XML.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeserializer.innertext
     * @type {HSTRING} 
     */
    InnerText {
        get => this.get_InnerText()
        set => this.put_InnerText(value)
    }

    /**
     * Returns the XML representation of the node and all its descendants.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeserializer.getxml
     */
    GetXml() {
        outerXml := HSTRING()
        result := ComCall(6, this, "ptr", outerXml, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return outerXml
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InnerText() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
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
    put_InnerText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
