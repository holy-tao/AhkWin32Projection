#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpNameValueHeaderValue.ahk
#Include .\IHttpCacheDirectiveHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Cache-Control** HTTP header on HTTP content associated with an HTTP request or response.
 * @remarks
 * The HttpCacheDirectiveHeaderValueCollection class represents the value of the **Cache-Control** HTTP header on HTTP content associated with an HTTP request or an HTTP response.
 * 
 * The [CacheControl](httprequestheadercollection_cachecontrol.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpCacheDirectiveHeaderValueCollection. The [CacheControl](httpresponseheadercollection_cachecontrol.md) property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) returns an HttpCacheDirectiveHeaderValueCollection.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpCacheDirectiveHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpCacheDirectiveHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpCacheDirectiveHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the value of the **max-age** directive in the **Cache-Control** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.maxage
     * @type {IReference<TimeSpan>} 
     */
    MaxAge {
        get => this.get_MaxAge()
        set => this.put_MaxAge(value)
    }

    /**
     * Gets or sets the value of the **max-stale** directive in the **Cache-Control** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.maxstale
     * @type {IReference<TimeSpan>} 
     */
    MaxStale {
        get => this.get_MaxStale()
        set => this.put_MaxStale(value)
    }

    /**
     * Gets or sets the value of the **min-fresh** directive in the **Cache-Control** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.minfresh
     * @type {IReference<TimeSpan>} 
     */
    MinFresh {
        get => this.get_MinFresh()
        set => this.put_MinFresh(value)
    }

    /**
     * Gets or sets the value of the **s-maxage** directive in the **Cache-Control** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.sharedmaxage
     * @type {IReference<TimeSpan>} 
     */
    SharedMaxAge {
        get => this.get_SharedMaxAge()
        set => this.put_SharedMaxAge(value)
    }

    /**
     * Gets the number of [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.size
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
     * @returns {IReference<TimeSpan>} 
     */
    get_MaxAge() {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.get_MaxAge()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_MaxAge(value) {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.put_MaxAge(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MaxStale() {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.get_MaxStale()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_MaxStale(value) {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.put_MaxStale(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MinFresh() {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.get_MinFresh()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_MinFresh(value) {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.put_MinFresh(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SharedMaxAge() {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.get_SharedMaxAge()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SharedMaxAge(value) {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.put_SharedMaxAge(value)
    }

    /**
     * Parses and adds an entry to the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @remarks
     * Below are exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpCacheDirectiveHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpCacheDirectiveHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheDirectiveHeaderValueCollection := IHttpCacheDirectiveHeaderValueCollection(outPtr)
        }

        return this.__IHttpCacheDirectiveHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) in the collection.
     * @param {Generic} value The [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) to find in the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) in the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) item to the end of the collection.
     * @param {Generic} value The [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) object to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) items in the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) items that start at *startIndex* in the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) items in the collection with the specified [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The collection of [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2cf800d4-35d0-545c-ab82-f6793be74cba}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{5838a126-b617-5417-b32e-ded2d27d40a3}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpNameValueHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcachedirectiveheadervaluecollection.tostring
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
