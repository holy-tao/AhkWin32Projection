#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IXmlNode.ahk
#Include .\IXmlNamedNodeMap.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates iteration through the collection of attribute nodes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlNamedNodeMap extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlNamedNodeMap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlNamedNodeMap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the length of the list of nodes.
     * @remarks
     * The range of valid child node indices is 0 to length-1 inclusive.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets the number of elements in the vector view.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.get_Length()
    }

    /**
     * Allows random access to individual nodes within the collection.
     * @remarks
     * > **Microsoft .NET**
     * > For C# and Microsoft Visual Basic, [XmlNamedNodeMap](xmlnamednodemap.md) has a property named [ItemOf](/dotnet/api/system.xml.xmlattributecollection.itemof) (not a method). That property is the Microsoft .NET indexer property for the collection. For more info and the usage syntax see [ItemOf](/dotnet/api/system.xml.xmlattributecollection.itemof).
     * @param {Integer} index The index of the item within the collection. The first item is zero.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.item
     */
    Item(index) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.Item(index)
    }

    /**
     * Retrieves the attribute with the specified name.
     * @param {HSTRING} name The name of the attribute.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.getnameditem
     */
    GetNamedItem(name) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.GetNamedItem(name)
    }

    /**
     * Adds the specified node to the collection.
     * @param {IXmlNode} node_ The node to add to the collection.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.setnameditem
     */
    SetNamedItem(node_) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.SetNamedItem(node_)
    }

    /**
     * Removes the specified item.
     * @param {HSTRING} name The name of the attribute to remove from the collection.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.removenameditem
     */
    RemoveNamedItem(name) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.RemoveNamedItem(name)
    }

    /**
     * Retrieves the attribute with the specified namespace and name.
     * @param {IInspectable} namespaceUri The namespace name of the attribute.
     * @param {HSTRING} name The name of the attribute.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.getnameditemns
     */
    GetNamedItemNS(namespaceUri, name) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.GetNamedItemNS(namespaceUri, name)
    }

    /**
     * Removes an item that is specified by a namespace and local name.
     * @param {IInspectable} namespaceUri The namespace name of the attribute.
     * @param {HSTRING} name The name of the attribute.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.removenameditemns
     */
    RemoveNamedItemNS(namespaceUri, name) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.RemoveNamedItemNS(namespaceUri, name)
    }

    /**
     * Adds the specified node to the collection in the specified namespace. If you are not using any namespaces, then use the [SetNamedItem](xmlnamednodemap_setnameditem_762437060.md) method.
     * @param {IXmlNode} node_ The node to add to the collection.
     * 
     * > [!NOTE]
     * > You set the namespace when you create the node using the [CreateAttributeNS](xmldocument_createattributens_84639206.md) or [CreateElementNS](xmldocument_createelementns_1302649478.md) methods.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.setnameditemns
     */
    SetNamedItemNS(node_) {
        if (!this.HasProp("__IXmlNamedNodeMap")) {
            if ((queryResult := this.QueryInterface(IXmlNamedNodeMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNamedNodeMap := IXmlNamedNodeMap(outPtr)
        }

        return this.__IXmlNamedNodeMap.SetNamedItemNS(node_)
    }

    /**
     * Returns the item at the specified index in the vector view.
     * @param {Integer} index The zero-based index of the item in the vector view to return.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{139d959e-e7b5-5cb6-a596-4b544478da9b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IXmlNode, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{139d959e-e7b5-5cb6-a596-4b544478da9b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IXmlNode, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Returns the index of a specified item in the vector view.
     * @param {Generic} value The item to find in the vector view.
     * @param {Pointer<UInt32>} index The zero-based index of the item if found. Zero is returned if the item is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{139d959e-e7b5-5cb6-a596-4b544478da9b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IXmlNode, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Returns the items that start at the specified index of the vector view.
     * @param {Integer} startIndex The zero-based index of the start of the items in the vector to return.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The items in the vector view that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{139d959e-e7b5-5cb6-a596-4b544478da9b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IXmlNode, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator that iterates over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnamednodemap.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{f1146ffc-8c92-56e8-93f1-711f86722633}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IXmlNode, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
