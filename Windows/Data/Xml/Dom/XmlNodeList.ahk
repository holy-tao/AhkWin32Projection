#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IXmlNode.ahk
#Include .\IXmlNodeList.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a collection of nodes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlNodeList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlNodeList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlNodeList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the length of the list.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets the number of elements in the vector view.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.size
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
        if (!this.HasProp("__IXmlNodeList")) {
            if ((queryResult := this.QueryInterface(IXmlNodeList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeList := IXmlNodeList(outPtr)
        }

        return this.__IXmlNodeList.get_Length()
    }

    /**
     * Returns the item in the list at the specified index.
     * @param {Integer} index The zero-based index of the requested item.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.item
     */
    Item(index) {
        if (!this.HasProp("__IXmlNodeList")) {
            if ((queryResult := this.QueryInterface(IXmlNodeList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlNodeList := IXmlNodeList(outPtr)
        }

        return this.__IXmlNodeList.Item(index)
    }

    /**
     * Returns the item at the specified index in the vector view.
     * @param {Integer} index The zero-based index of the item in the vector view to return.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.getat
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
     * Returns the index of a specified item in the vector.
     * @param {Generic} value The item to find in the vector.
     * @param {Pointer<UInt32>} index The zero-based index of the item if found. Zero is returned if the item is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.indexof
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.getmany
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
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmlnodelist.first
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
