#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpConnectionOptionHeaderValue.ahk
#Include .\IHttpConnectionOptionHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Connection** HTTP header on an HTTP request.
 * @remarks
 * The HttpConnectionOptionHeaderValueCollection represents the value of the **Connection** HTTP header on an HTTP request.
 * 
 * The HttpConnectionOptionHeaderValueCollection is a collection of [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) objects used for connection information on the HTTP **Connection** header.
 * 
 * The [Connection](httprequestheadercollection_connection.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpConnectionOptionHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpConnectionOptionHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpConnectionOptionHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpConnectionOptionHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @remarks
     * Below are exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpConnectionOptionHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpConnectionOptionHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpConnectionOptionHeaderValueCollection := IHttpConnectionOptionHeaderValueCollection(outPtr)
        }

        return this.__IHttpConnectionOptionHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpConnectionOptionHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpConnectionOptionHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpConnectionOptionHeaderValueCollection := IHttpConnectionOptionHeaderValueCollection(outPtr)
        }

        return this.__IHttpConnectionOptionHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) in the collection.
     * @param {Generic} value The [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) to find in the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) in the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) item to the end of the collection.
     * @param {Generic} value The [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) object to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) items in the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) items that start at *startIndex* in the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) items in the collection with the specified [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The collection of [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c312da8d-c82f-51c9-b705-5a26d52fbee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{1afc512f-dfa2-5528-8aef-6e6a37789b3c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpConnectionOptionHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervaluecollection.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
