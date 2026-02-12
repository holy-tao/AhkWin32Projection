#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpContentCodingHeaderValue.ahk
#Include .\IHttpContentCodingHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Content-Encoding** HTTP header on HTTP content in a request or a response.
 * @remarks
 * The HttpContentCodingHeaderValueCollection class represents the value of the **Content-Encoding** HTTP header on HTTP content sent in an HTTP request or received in an HTTP response.
 * 
 * The HttpContentCodingHeaderValueCollection provides a collection container for instances of the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) class objects used for content encoding information in the **Content-Encoding** HTTP header.
 * 
 * The [ContentEncoding](httpcontentheadercollection_contentencoding.md) property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) returns an HttpContentCodingHeaderValueCollection.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentCodingHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentCodingHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentCodingHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpContentCodingHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingHeaderValueCollection := IHttpContentCodingHeaderValueCollection(outPtr)
        }

        return this.__IHttpContentCodingHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpContentCodingHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingHeaderValueCollection := IHttpContentCodingHeaderValueCollection(outPtr)
        }

        return this.__IHttpContentCodingHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) in the collection.
     * @param {Generic} value The [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) to find in the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) in the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) item to the end of the collection.
     * @param {Generic} value The [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) object to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) items in the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) items that start at *startIndex* in the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) items in the collection with the specified [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b94e539f-44b6-54c6-9ad4-e2844b3e0be1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{0e8960c2-76e5-56c1-9fe6-8cd9018a6786}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpContentCodingHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervaluecollection.tostring
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
