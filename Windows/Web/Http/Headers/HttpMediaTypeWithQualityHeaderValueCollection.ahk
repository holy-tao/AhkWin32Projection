#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpMediaTypeWithQualityHeaderValue.ahk
#Include .\IHttpMediaTypeWithQualityHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Accept** HTTP header on an HTTP request.
 * @remarks
 * The HttpMediaTypeWithQualityHeaderValueCollection represents the value of the **Accept** HTTP header on an HTTP request.
 * 
 * The HttpMediaTypeWithQualityHeaderValueCollection is a collection of [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) objects used for accept information in the HTTP **Accept** header.
 * 
 * The [Accept](httprequestheadercollection_accept.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpMediaTypeWithQualityHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpMediaTypeWithQualityHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpMediaTypeWithQualityHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpMediaTypeWithQualityHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValueCollection := IHttpMediaTypeWithQualityHeaderValueCollection(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValueCollection := IHttpMediaTypeWithQualityHeaderValueCollection(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the collection.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) in the collection.
     * @param {Generic} value The [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) to find in the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) in the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) item to the end of the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) items in the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) items that start at *startIndex* in the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) items in the collection with the specified [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{c18538f7-c256-5666-8868-2225af3574b6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{ffc7dfde-58b8-51e9-b33b-65a5d6a4e24c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpMediaTypeWithQualityHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervaluecollection.tostring
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
