#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpChallengeHeaderValue.ahk
#Include .\IHttpChallengeHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Proxy-Authenticate** or **WWW-Authenticate** HTTP header on an HTTP response.
 * @remarks
 * The HttpChallengeHeaderValueCollection represents the value of the **Proxy-Authenticate** or **WWW-Authenticate** HTTP header on an HTTP response.
 * 
 * The HttpChallengeHeaderValueCollection provides a collection container for instances of the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) class used for authentication information used in the **Authorization**, **ProxyAuthorization**, **WWW-Authenticate**, and **Proxy-Authenticate** HTTP header values.
 * 
 * The [ProxyAuthenticate](httpresponseheadercollection_proxyauthenticate.md) property on [HttpResponseHeaderCollection](httpresponseheadercollection.md) returns an HttpChallengeHeaderValueCollection object. The [WwwAuthenticate](httpresponseheadercollection_wwwauthenticate.md) property on [HttpResponseHeaderCollection](httpresponseheadercollection.md) also returns an HttpChallengeHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpChallengeHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpChallengeHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpChallengeHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpChallengeHeaderValue](httpchallengeheadervalue.md) objects in the collection.
     * @remarks
     * The Size value returns the true number of items. API that use the index, such as [IndexOf](httpchallengeheadervaluecollection_indexof_643099624.md), use a zero-based index, so you would subtract one from Size in order to specify that you want the last item in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @remarks
     * Below are exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpChallengeHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpChallengeHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpChallengeHeaderValueCollection := IHttpChallengeHeaderValueCollection(outPtr)
        }

        return this.__IHttpChallengeHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpChallengeHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpChallengeHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpChallengeHeaderValueCollection := IHttpChallengeHeaderValueCollection(outPtr)
        }

        return this.__IHttpChallengeHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @remarks
     * When programming with .NET, this method is hidden.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpChallengeHeaderValue](httpchallengeheadervalue.md) in the collection.
     * @param {Generic} value The [HttpChallengeHeaderValue](httpchallengeheadervalue.md) to find in the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) in the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpChallengeHeaderValue](httpchallengeheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpChallengeHeaderValue](httpchallengeheadervalue.md) into the collection at the specified index.
     * @remarks
     * To add an item to the end position in the collection, you can use the [Append](httpchallengeheadervaluecollection_append_1860232408.md) method. Calling InsertAt with an *index* value that is the same as the [Size](httpchallengeheadervaluecollection_size.md) value is equivalent to calling [Append](httpchallengeheadervaluecollection_append_1860232408.md).
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpChallengeHeaderValue](httpchallengeheadervalue.md) item to the end of the collection.
     * @remarks
     * After you've added an item, you can use the [IndexOf](httpchallengeheadervaluecollection_indexof_643099624.md) method to get it by index.
     * 
     * To add an item to a position in the collection that's not at the collection end, use the [InsertAt](httpchallengeheadervaluecollection_insertat_1228553710.md) method.
     * @param {Generic} value The [HttpChallengeHeaderValue](httpchallengeheadervalue.md) object to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpChallengeHeaderValue](httpchallengeheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all [HttpChallengeHeaderValue](httpchallengeheadervalue.md) objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) items that start at the specified index in the collection.
     * @remarks
     * The elements are copied to the array in the same order in which the enumerator iterates through the collection. It's typical to specify *startIndex* as 0 if all you're doing is making a simple copy of the collection items, where you've created a destination array with a length that matches the [Size](httpchallengeheadervaluecollection_size.md) of the collection you're copying.
     * 
     * This method will throw an exception if the number of elements in the source collection is greater than the length of the destination array specified in *items*.
     * 
     * If you are programming using Visual C++ component extensions (C++/CX) or JavaScript, you can make an [IVectorView](../windows.foundation.collections/ivectorview_1.md) copy by calling the [GetView](httpchallengeheadervaluecollection_getview_37498667.md) method.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) items in the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpChallengeHeaderValue](httpchallengeheadervalue.md) items that start at *startIndex* in the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) items in the collection with the specified [HttpChallengeHeaderValue](httpchallengeheadervalue.md) items.
     * @remarks
     * When programming with .NET, this method is hidden.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The collection of [HttpChallengeHeaderValue](httpchallengeheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{3737fc5e-0b27-52a3-9e40-cbb9844e6ab7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpChallengeHeaderValue](httpchallengeheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{17847e58-f0cf-52e7-81c0-9d06a081569f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpChallengeHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervaluecollection.tostring
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
