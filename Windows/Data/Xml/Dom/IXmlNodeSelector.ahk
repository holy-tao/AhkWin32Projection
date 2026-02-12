#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXmlNode.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XmlNodeList.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Encapsulates the methods needed to execute XPath queries on an XML DOM tree or subtree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeselector
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlNodeSelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlNodeSelector
     * @type {Guid}
     */
    static IID => Guid("{63dbba8b-d0db-4fe1-b745-f9433afdc25b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectSingleNode", "SelectNodes", "SelectSingleNodeNS", "SelectNodesNS"]

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the first matching node.
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeselector.selectsinglenode
     */
    SelectSingleNode(xpath) {
        if(xpath is String) {
            pin := HSTRING.Create(xpath)
            xpath := pin.Value
        }
        xpath := xpath is Win32Handle ? NumGet(xpath, "ptr") : xpath

        result := ComCall(6, this, "ptr", xpath, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(node_)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the list of matching nodes as an [XmlNodeList](xmlnodelist.md).
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @returns {XmlNodeList} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeselector.selectnodes
     */
    SelectNodes(xpath) {
        if(xpath is String) {
            pin := HSTRING.Create(xpath)
            xpath := pin.Value
        }
        xpath := xpath is Win32Handle ? NumGet(xpath, "ptr") : xpath

        result := ComCall(7, this, "ptr", xpath, "ptr*", &nodelist := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNodeList(nodelist)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the first matching node.
     * @remarks
     * Prefixes in the query are resolved using the specified namespace declarations.
     * @param {HSTRING} xpath Specifies an XPath expression.
     * @param {IInspectable} namespaces Contains a string that specifies the namespaces to use in XPath expressions when it is necessary to define new namespaces externally. Namespaces are defined in the XML style, as a space-separated list of namespace declaration attributes. You can use this property to set the default namespace as well.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeselector.selectsinglenodens
     */
    SelectSingleNodeNS(xpath, namespaces) {
        if(xpath is String) {
            pin := HSTRING.Create(xpath)
            xpath := pin.Value
        }
        xpath := xpath is Win32Handle ? NumGet(xpath, "ptr") : xpath

        result := ComCall(8, this, "ptr", xpath, "ptr", namespaces, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(node_)
    }

    /**
     * Applies the specified pattern-matching operation to this node's context and returns the list of matching nodes as an [XmlNodeList](xmlnodelist.md).
     * @remarks
     * Prefixes in the query are resolved using the specified namespace declarations.
     * @param {HSTRING} xpath Specifies an XPath expresssion.
     * @param {IInspectable} namespaces Contains a string that specifies namespaces for use in XPath expressions when it is necessary to define new namespaces externally. Namespaces are defined in the XML style, as a space-separated list of namespace declaration attributes. You can use this property to set the default namespace as well.
     * @returns {XmlNodeList} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlnodeselector.selectnodesns
     */
    SelectNodesNS(xpath, namespaces) {
        if(xpath is String) {
            pin := HSTRING.Create(xpath)
            xpath := pin.Value
        }
        xpath := xpath is Win32Handle ? NumGet(xpath, "ptr") : xpath

        result := ComCall(9, this, "ptr", xpath, "ptr", namespaces, "ptr*", &nodelist := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNodeList(nodelist)
    }
}
