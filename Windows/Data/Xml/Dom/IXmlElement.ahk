#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XmlAttribute.ahk
#Include .\XmlNodeList.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlElement
     * @type {Guid}
     */
    static IID => Guid("{2dfb8a1f-6b10-4ef8-9f83-efcce8faec37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TagName", "GetAttribute", "SetAttribute", "RemoveAttribute", "GetAttributeNode", "SetAttributeNode", "RemoveAttributeNode", "GetElementsByTagName", "SetAttributeNS", "GetAttributeNS", "RemoveAttributeNS", "SetAttributeNodeNS", "GetAttributeNodeNS"]

    /**
     * @type {HSTRING} 
     */
    TagName {
        get => this.get_TagName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TagName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} attributeName 
     * @returns {HSTRING} 
     */
    GetAttribute(attributeName) {
        if(attributeName is String) {
            pin := HSTRING.Create(attributeName)
            attributeName := pin.Value
        }
        attributeName := attributeName is Win32Handle ? NumGet(attributeName, "ptr") : attributeName

        attributeValue := HSTRING()
        result := ComCall(7, this, "ptr", attributeName, "ptr", attributeValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return attributeValue
    }

    /**
     * 
     * @param {HSTRING} attributeName 
     * @param {HSTRING} attributeValue 
     * @returns {HRESULT} 
     */
    SetAttribute(attributeName, attributeValue) {
        if(attributeName is String) {
            pin := HSTRING.Create(attributeName)
            attributeName := pin.Value
        }
        attributeName := attributeName is Win32Handle ? NumGet(attributeName, "ptr") : attributeName
        if(attributeValue is String) {
            pin := HSTRING.Create(attributeValue)
            attributeValue := pin.Value
        }
        attributeValue := attributeValue is Win32Handle ? NumGet(attributeValue, "ptr") : attributeValue

        result := ComCall(8, this, "ptr", attributeName, "ptr", attributeValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} attributeName 
     * @returns {HRESULT} 
     */
    RemoveAttribute(attributeName) {
        if(attributeName is String) {
            pin := HSTRING.Create(attributeName)
            attributeName := pin.Value
        }
        attributeName := attributeName is Win32Handle ? NumGet(attributeName, "ptr") : attributeName

        result := ComCall(9, this, "ptr", attributeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} attributeName 
     * @returns {XmlAttribute} 
     */
    GetAttributeNode(attributeName) {
        if(attributeName is String) {
            pin := HSTRING.Create(attributeName)
            attributeName := pin.Value
        }
        attributeName := attributeName is Win32Handle ? NumGet(attributeName, "ptr") : attributeName

        result := ComCall(10, this, "ptr", attributeName, "ptr*", &attributeNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(attributeNode)
    }

    /**
     * 
     * @param {XmlAttribute} newAttribute 
     * @returns {XmlAttribute} 
     */
    SetAttributeNode(newAttribute) {
        result := ComCall(11, this, "ptr", newAttribute, "ptr*", &previousAttribute := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(previousAttribute)
    }

    /**
     * 
     * @param {XmlAttribute} attributeNode 
     * @returns {XmlAttribute} 
     */
    RemoveAttributeNode(attributeNode) {
        result := ComCall(12, this, "ptr", attributeNode, "ptr*", &removedAttribute := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(removedAttribute)
    }

    /**
     * 
     * @param {HSTRING} tagName 
     * @returns {XmlNodeList} 
     */
    GetElementsByTagName(tagName) {
        if(tagName is String) {
            pin := HSTRING.Create(tagName)
            tagName := pin.Value
        }
        tagName := tagName is Win32Handle ? NumGet(tagName, "ptr") : tagName

        result := ComCall(13, this, "ptr", tagName, "ptr*", &elements := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNodeList(elements)
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} qualifiedName 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetAttributeNS(namespaceUri, qualifiedName, value) {
        if(qualifiedName is String) {
            pin := HSTRING.Create(qualifiedName)
            qualifiedName := pin.Value
        }
        qualifiedName := qualifiedName is Win32Handle ? NumGet(qualifiedName, "ptr") : qualifiedName
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", namespaceUri, "ptr", qualifiedName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} localName 
     * @returns {HSTRING} 
     */
    GetAttributeNS(namespaceUri, localName) {
        if(localName is String) {
            pin := HSTRING.Create(localName)
            localName := pin.Value
        }
        localName := localName is Win32Handle ? NumGet(localName, "ptr") : localName

        value := HSTRING()
        result := ComCall(15, this, "ptr", namespaceUri, "ptr", localName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} localName 
     * @returns {HRESULT} 
     */
    RemoveAttributeNS(namespaceUri, localName) {
        if(localName is String) {
            pin := HSTRING.Create(localName)
            localName := pin.Value
        }
        localName := localName is Win32Handle ? NumGet(localName, "ptr") : localName

        result := ComCall(16, this, "ptr", namespaceUri, "ptr", localName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {XmlAttribute} newAttribute 
     * @returns {XmlAttribute} 
     */
    SetAttributeNodeNS(newAttribute) {
        result := ComCall(17, this, "ptr", newAttribute, "ptr*", &previousAttribute := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(previousAttribute)
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} localName 
     * @returns {XmlAttribute} 
     */
    GetAttributeNodeNS(namespaceUri, localName) {
        if(localName is String) {
            pin := HSTRING.Create(localName)
            localName := pin.Value
        }
        localName := localName is Win32Handle ? NumGet(localName, "ptr") : localName

        result := ComCall(18, this, "ptr", namespaceUri, "ptr", localName, "ptr*", &previousAttribute := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(previousAttribute)
    }
}
