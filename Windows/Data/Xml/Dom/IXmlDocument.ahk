#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XmlDocumentType.ahk
#Include .\XmlDomImplementation.ahk
#Include .\XmlElement.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XmlDocumentFragment.ahk
#Include .\XmlText.ahk
#Include .\XmlComment.ahk
#Include .\XmlProcessingInstruction.ahk
#Include .\XmlAttribute.ahk
#Include .\XmlEntityReference.ahk
#Include .\XmlNodeList.ahk
#Include .\XmlCDataSection.ahk
#Include .\IXmlNode.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlDocument extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlDocument
     * @type {Guid}
     */
    static IID => Guid("{f7f3a506-1e87-42d6-bcfb-b8c809fa5494}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Doctype", "get_Implementation", "get_DocumentElement", "CreateElement", "CreateDocumentFragment", "CreateTextNode", "CreateComment", "CreateProcessingInstruction", "CreateAttribute", "CreateEntityReference", "GetElementsByTagName", "CreateCDataSection", "get_DocumentUri", "CreateAttributeNS", "CreateElementNS", "GetElementById", "ImportNode"]

    /**
     * @type {XmlDocumentType} 
     */
    Doctype {
        get => this.get_Doctype()
    }

    /**
     * @type {XmlDomImplementation} 
     */
    Implementation {
        get => this.get_Implementation()
    }

    /**
     * @type {XmlElement} 
     */
    DocumentElement {
        get => this.get_DocumentElement()
    }

    /**
     * @type {HSTRING} 
     */
    DocumentUri {
        get => this.get_DocumentUri()
    }

    /**
     * 
     * @returns {XmlDocumentType} 
     */
    get_Doctype() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocumentType(value)
    }

    /**
     * 
     * @returns {XmlDomImplementation} 
     */
    get_Implementation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDomImplementation(value)
    }

    /**
     * 
     * @returns {XmlElement} 
     */
    get_DocumentElement() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlElement(value)
    }

    /**
     * 
     * @param {HSTRING} tagName 
     * @returns {XmlElement} 
     */
    CreateElement(tagName) {
        if(tagName is String) {
            pin := HSTRING.Create(tagName)
            tagName := pin.Value
        }
        tagName := tagName is Win32Handle ? NumGet(tagName, "ptr") : tagName

        result := ComCall(9, this, "ptr", tagName, "ptr*", &newElement := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlElement(newElement)
    }

    /**
     * 
     * @returns {XmlDocumentFragment} 
     */
    CreateDocumentFragment() {
        result := ComCall(10, this, "ptr*", &newDocumentFragment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocumentFragment(newDocumentFragment)
    }

    /**
     * 
     * @param {HSTRING} data 
     * @returns {XmlText} 
     */
    CreateTextNode(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(11, this, "ptr", data, "ptr*", &newTextNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlText(newTextNode)
    }

    /**
     * 
     * @param {HSTRING} data 
     * @returns {XmlComment} 
     */
    CreateComment(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(12, this, "ptr", data, "ptr*", &newComment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlComment(newComment)
    }

    /**
     * 
     * @param {HSTRING} target 
     * @param {HSTRING} data 
     * @returns {XmlProcessingInstruction} 
     */
    CreateProcessingInstruction(target, data) {
        if(target is String) {
            pin := HSTRING.Create(target)
            target := pin.Value
        }
        target := target is Win32Handle ? NumGet(target, "ptr") : target
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(13, this, "ptr", target, "ptr", data, "ptr*", &newProcessingInstruction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlProcessingInstruction(newProcessingInstruction)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {XmlAttribute} 
     */
    CreateAttribute(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(14, this, "ptr", name, "ptr*", &newAttribute := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(newAttribute)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {XmlEntityReference} 
     */
    CreateEntityReference(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(15, this, "ptr", name, "ptr*", &newEntityReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlEntityReference(newEntityReference)
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

        result := ComCall(16, this, "ptr", tagName, "ptr*", &elements := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNodeList(elements)
    }

    /**
     * 
     * @param {HSTRING} data 
     * @returns {XmlCDataSection} 
     */
    CreateCDataSection(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(17, this, "ptr", data, "ptr*", &newCDataSection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlCDataSection(newCDataSection)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentUri() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} qualifiedName 
     * @returns {XmlAttribute} 
     */
    CreateAttributeNS(namespaceUri, qualifiedName) {
        if(qualifiedName is String) {
            pin := HSTRING.Create(qualifiedName)
            qualifiedName := pin.Value
        }
        qualifiedName := qualifiedName is Win32Handle ? NumGet(qualifiedName, "ptr") : qualifiedName

        result := ComCall(19, this, "ptr", namespaceUri, "ptr", qualifiedName, "ptr*", &newAttribute := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlAttribute(newAttribute)
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} qualifiedName 
     * @returns {XmlElement} 
     */
    CreateElementNS(namespaceUri, qualifiedName) {
        if(qualifiedName is String) {
            pin := HSTRING.Create(qualifiedName)
            qualifiedName := pin.Value
        }
        qualifiedName := qualifiedName is Win32Handle ? NumGet(qualifiedName, "ptr") : qualifiedName

        result := ComCall(20, this, "ptr", namespaceUri, "ptr", qualifiedName, "ptr*", &newElement := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlElement(newElement)
    }

    /**
     * 
     * @param {HSTRING} elementId 
     * @returns {XmlElement} 
     */
    GetElementById(elementId) {
        if(elementId is String) {
            pin := HSTRING.Create(elementId)
            elementId := pin.Value
        }
        elementId := elementId is Win32Handle ? NumGet(elementId, "ptr") : elementId

        result := ComCall(21, this, "ptr", elementId, "ptr*", &element := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlElement(element)
    }

    /**
     * 
     * @param {IXmlNode} node_ 
     * @param {Boolean} deep 
     * @returns {IXmlNode} 
     */
    ImportNode(node_, deep) {
        result := ComCall(22, this, "ptr", node_, "int", deep, "ptr*", &newNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(newNode)
    }
}
