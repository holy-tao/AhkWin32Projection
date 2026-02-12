#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpProductInfoHeaderValue.ahk
#Include .\IHttpProductInfoHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **User-Agent** HTTP header on an HTTP request.
 * @remarks
 * The HttpProductInfoHeaderValueCollection represents the value of the **User-Agent** HTTP header on an HTTP request.
 * 
 * The HttpProductInfoHeaderValueCollection is a collection of [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) objects used for product information in the HTTP **User-Agent** header.
 * 
 * The **User-Agent** header contains information about the user agent originating the request. The **User-Agent** header can contain multiple product tokens and comments identifying the user agent and any sub-products.
 * 
 * The [UserAgent](httprequestheadercollection_useragent.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpProductInfoHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpProductInfoHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpProductInfoHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpProductInfoHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpProductInfoHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpProductInfoHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpProductInfoHeaderValueCollection := IHttpProductInfoHeaderValueCollection(outPtr)
        }

        return this.__IHttpProductInfoHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpProductInfoHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpProductInfoHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpProductInfoHeaderValueCollection := IHttpProductInfoHeaderValueCollection(outPtr)
        }

        return this.__IHttpProductInfoHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the collection.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) in the collection.
     * @param {Generic} value The [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) to find in the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) in the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the HttpMethodHeaderValueCollection.
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) item to the end of the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) items in the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) items that start at *startIndex* in the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) items in the collection with the specified [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{69392060-6c0f-5de6-8ced-f14fc1b83376}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{bf97cf99-e614-5765-bad7-161ae3a93ae9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpProductInfoHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervaluecollection.tostring
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
