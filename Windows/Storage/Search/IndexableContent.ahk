#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIndexableContent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents app content and properties that can be added to the [ContentIndexer](contentindexer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexablecontent
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IndexableContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIndexableContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIndexableContent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the identifier for the content properties in the [IndexableContent](indexablecontent.md) object. Changes to the actual representation of the item in the index can be made using the [ContentIndexer](contentindexer.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexablecontent.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets the content properties.
     * @remarks
     * While access to this type is read-only, it returns a read/write map.
     * 
     * Add a property to index by calling the [Insert](../windows.foundation.collections/imap_2_insert_884970571.md) method with a standard Windows property name, like [System.Author](/windows/desktop/properties/props-system-author), and a [PropertyValue](../windows.foundation/propertyvalue.md).
     * 
     * When you're done adding properties to the current [IndexableContent](indexablecontent.md), call the [AddAsync](contentindexer_addasync_916871935.md) method to add the properties to the system index.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexablecontent.properties
     * @type {IMap<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets a Stream that provides full-text content. Changes to the actual representation of the item in the index can be made using the [ContentIndexer](contentindexer.md) class.
     * @remarks
     * Assign the Stream property when the content properties are backed by a file or another kind of stream. This is particularly useful for providing full text content.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexablecontent.stream
     * @type {IRandomAccessStream} 
     */
    Stream {
        get => this.get_Stream()
        set => this.put_Stream(value)
    }

    /**
     * Specifies the type of content in the [Stream](indexablecontent_stream.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexablecontent.streamcontenttype
     * @type {HSTRING} 
     */
    StreamContentType {
        get => this.get_StreamContentType()
        set => this.put_StreamContentType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [IndexableContent](indexablecontent.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.IndexableContent")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.put_Id(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.get_Properties()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Stream() {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.get_Stream()
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {HRESULT} 
     */
    put_Stream(value) {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.put_Stream(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StreamContentType() {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.get_StreamContentType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_StreamContentType(value) {
        if (!this.HasProp("__IIndexableContent")) {
            if ((queryResult := this.QueryInterface(IIndexableContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexableContent := IIndexableContent(outPtr)
        }

        return this.__IIndexableContent.put_StreamContentType(value)
    }

;@endregion Instance Methods
}
