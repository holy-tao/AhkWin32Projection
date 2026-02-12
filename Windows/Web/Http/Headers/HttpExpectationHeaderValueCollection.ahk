#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpExpectationHeaderValue.ahk
#Include .\IHttpExpectationHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Expect** HTTP header on an HTTP request.
 * @remarks
 * The HttpExpectationHeaderValueCollection class represents the value of the **Expect** HTTP header on an HTTP request.
 * 
 * The HttpExpectationHeaderValueCollection provides a collection container for instances of the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) class used for expect information in the **Expect** HTTP header.
 * 
 * The [Expect](httprequestheadercollection_expect.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpExpectationHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpExpectationHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpExpectationHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpExpectationHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpExpectationHeaderValue](httpexpectationheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpExpectationHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpExpectationHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpExpectationHeaderValueCollection := IHttpExpectationHeaderValueCollection(outPtr)
        }

        return this.__IHttpExpectationHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpExpectationHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpExpectationHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpExpectationHeaderValueCollection := IHttpExpectationHeaderValueCollection(outPtr)
        }

        return this.__IHttpExpectationHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the collection.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpExpectationHeaderValue](httpexpectationheadervalue.md) in the collection.
     * @param {Generic} value The [HttpExpectationHeaderValue](httpexpectationheadervalue.md) to find in the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) in the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpExpectationHeaderValue](httpexpectationheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpExpectationHeaderValue](httpexpectationheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpExpectationHeaderValue](httpexpectationheadervalue.md) item to the end of the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpExpectationHeaderValue](httpexpectationheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) items in the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpExpectationHeaderValue](httpexpectationheadervalue.md) items that start at *startIndex* in the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) items in the collection with the specified [HttpExpectationHeaderValue](httpexpectationheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpExpectationHeaderValue](httpexpectationheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{18e138ee-fec7-527d-8693-deebca4f3dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpExpectationHeaderValue](httpexpectationheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{0a391c2b-13c3-59b8-8662-13affb9d1754}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpExpectationHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervaluecollection.tostring
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
