#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXmlNode.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlNamedNodeMap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlNamedNodeMap
     * @type {Guid}
     */
    static IID => Guid("{b3a69eb0-aab0-4b82-a6fa-b1453f7c021b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Length", "Item", "GetNamedItem", "SetNamedItem", "RemoveNamedItem", "GetNamedItemNS", "RemoveNamedItemNS", "SetNamedItemNS"]

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} index 
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(index) {
        result := ComCall(7, this, "uint", index, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(node_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IXmlNode} 
     */
    GetNamedItem(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(node_)
    }

    /**
     * 
     * @param {IXmlNode} node_ 
     * @returns {IXmlNode} 
     */
    SetNamedItem(node_) {
        result := ComCall(9, this, "ptr", node_, "ptr*", &previousNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(previousNode)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IXmlNode} 
     */
    RemoveNamedItem(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "ptr*", &previousNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(previousNode)
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} name 
     * @returns {IXmlNode} 
     */
    GetNamedItemNS(namespaceUri, name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", namespaceUri, "ptr", name, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(node_)
    }

    /**
     * 
     * @param {IInspectable} namespaceUri 
     * @param {HSTRING} name 
     * @returns {IXmlNode} 
     */
    RemoveNamedItemNS(namespaceUri, name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(12, this, "ptr", namespaceUri, "ptr", name, "ptr*", &previousNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(previousNode)
    }

    /**
     * 
     * @param {IXmlNode} node_ 
     * @returns {IXmlNode} 
     */
    SetNamedItemNS(node_) {
        result := ComCall(13, this, "ptr", node_, "ptr*", &previousNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(previousNode)
    }
}
