#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\Streams\IRandomAccessStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents app content and properties that can be added to the [ContentIndexer](contentindexer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.iindexablecontent
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IIndexableContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndexableContent
     * @type {Guid}
     */
    static IID => Guid("{ccf1a05f-d4b5-483a-b06e-e0db1ec420e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Id", "get_Properties", "get_Stream", "put_Stream", "get_StreamContentType", "put_StreamContentType"]

    /**
     * Gets or sets the identifier for the content properties in the [IIndexableContent](iindexablecontent.md) object. Changes to the actual representation of the item in the index can be made using the [ContentIndexer](contentindexer.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.iindexablecontent.id
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.iindexablecontent.properties
     * @type {IMap<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets a stream that provides full-text content. Changes to the actual representation of the item in the index can be made using the [ContentIndexer](contentindexer.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.iindexablecontent.stream
     * @type {IRandomAccessStream} 
     */
    Stream {
        get => this.get_Stream()
        set => this.put_Stream(value)
    }

    /**
     * Specifies the type of content in the [Stream](indexablecontent_stream.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.iindexablecontent.streamcontenttype
     * @type {HSTRING} 
     */
    StreamContentType {
        get => this.get_StreamContentType()
        set => this.put_StreamContentType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
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
    put_Id(value) {
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
     * @returns {IMap<HSTRING, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Stream() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {HRESULT} 
     */
    put_Stream(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StreamContentType() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
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
    put_StreamContentType(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
