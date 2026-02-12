#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpContentCodingWithQualityHeaderValue.ahk
#Include .\IHttpContentCodingWithQualityHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Accept-Encoding** HTTP header on an HTTP request.
 * @remarks
 * The HttpContentCodingWithQualityHeaderValueCollection class represents the value of the **Accept-Encoding** HTTP header on an HTTP request.
 * 
 * The HttpContentCodingWithQualityHeaderValueCollection provides a collection container for instances of the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) class used for accept encoding information in the **Accept-Encoding** HTTP header.
 * 
 * The [AcceptEncoding](httprequestheadercollection_acceptencoding.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpContentCodingWithQualityHeaderValueCollection object. This is the method used to construct an HttpContentCodingWithQualityHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentCodingWithQualityHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentCodingWithQualityHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentCodingWithQualityHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpContentCodingWithQualityHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingWithQualityHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingWithQualityHeaderValueCollection := IHttpContentCodingWithQualityHeaderValueCollection(outPtr)
        }

        return this.__IHttpContentCodingWithQualityHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpContentCodingWithQualityHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingWithQualityHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingWithQualityHeaderValueCollection := IHttpContentCodingWithQualityHeaderValueCollection(outPtr)
        }

        return this.__IHttpContentCodingWithQualityHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the collection.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) in the collection.
     * @param {Generic} value The [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) to find in the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) in the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) item to the end of the collection.
     * @param {Generic} value The [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) object to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) items in the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) items that start at *startIndex* in the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) items in the collection with the specified [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33f9653d-0eed-5368-a51e-98385191f86f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{916e6271-cef6-53b8-b93f-dc8dca559e50}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpContentCodingWithQualityHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervaluecollection.tostring
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
