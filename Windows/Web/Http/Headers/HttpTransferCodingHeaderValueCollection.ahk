#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpTransferCodingHeaderValue.ahk
#Include .\IHttpTransferCodingHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Transfer-Encoding** HTTP header on an HTTP request.
 * @remarks
 * The HttpTransferCodingHeaderValueCollection represents the value of the **Transfer-Encoding** HTTP header on an HTTP request.
 * 
 * The HttpTransferCodingHeaderValueCollection is a collection of [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) objects used for transfer coding information in the HTTP **Transfer-Encoding** header.
 * 
 * The [TransferEncoding](httprequestheadercollection_transferencoding.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpTransferCodingHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpTransferCodingHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpTransferCodingHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpTransferCodingHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpTransferCodingHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpTransferCodingHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransferCodingHeaderValueCollection := IHttpTransferCodingHeaderValueCollection(outPtr)
        }

        return this.__IHttpTransferCodingHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpTransferCodingHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpTransferCodingHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransferCodingHeaderValueCollection := IHttpTransferCodingHeaderValueCollection(outPtr)
        }

        return this.__IHttpTransferCodingHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the collection.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) in the collection.
     * @param {Generic} value The [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) to find in the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) in the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) item to the end of the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) items in the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) items that start at *startIndex* in the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) items in the collection with the specified [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{38e72562-e17c-5d68-aad1-8e8a860b8969}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{57402048-38bf-5055-acb6-5c4da765e388}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpTransferCodingHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervaluecollection.tostring
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
