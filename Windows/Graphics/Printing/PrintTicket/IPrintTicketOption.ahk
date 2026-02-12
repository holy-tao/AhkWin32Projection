#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Data\Xml\Dom\IXmlNode.ahk
#Include .\PrintTicketValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class IPrintTicketOption extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTicketOption
     * @type {Guid}
     */
    static IID => Guid("{b086cf90-b367-4e4b-bd48-9c78a0bb31ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_XmlNamespace", "get_XmlNode", "get_DisplayName", "GetPropertyNode", "GetScoredPropertyNode", "GetPropertyValue", "GetScoredPropertyValue"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @returns {IXmlNode} 
     */
    GetPropertyNode(name, xmlNamespace) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(10, this, "ptr", name, "ptr", xmlNamespace, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @returns {IXmlNode} 
     */
    GetScoredPropertyNode(name, xmlNamespace) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(11, this, "ptr", name, "ptr", xmlNamespace, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @returns {PrintTicketValue} 
     */
    GetPropertyValue(name, xmlNamespace) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(12, this, "ptr", name, "ptr", xmlNamespace, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketValue(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} xmlNamespace 
     * @returns {PrintTicketValue} 
     */
    GetScoredPropertyValue(name, xmlNamespace) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(xmlNamespace is String) {
            pin := HSTRING.Create(xmlNamespace)
            xmlNamespace := pin.Value
        }
        xmlNamespace := xmlNamespace is Win32Handle ? NumGet(xmlNamespace, "ptr") : xmlNamespace

        result := ComCall(13, this, "ptr", name, "ptr", xmlNamespace, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTicketValue(result_)
    }
}
