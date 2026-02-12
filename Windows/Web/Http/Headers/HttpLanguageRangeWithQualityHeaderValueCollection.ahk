#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HttpLanguageRangeWithQualityHeaderValue.ahk
#Include .\IHttpLanguageRangeWithQualityHeaderValueCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Accept-Language** HTTP header on an HTTP request.
 * @remarks
 * The HttpLanguageRangeWithQualityHeaderValueCollection class represents the value of the **Accept-Language** HTTP header on an HTTP request.
 * 
 * The HttpLanguageRangeWithQualityHeaderValueCollection provides a collection container for instances of the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) class used for accept language information in the **Accept-Language** HTTP header.
 * 
 * The [AcceptLanguage](httprequestheadercollection_acceptlanguage.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpLanguageRangeWithQualityHeaderValueCollection object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpLanguageRangeWithQualityHeaderValueCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpLanguageRangeWithQualityHeaderValueCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpLanguageRangeWithQualityHeaderValueCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.size
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
     * Parses and adds an entry to the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ The entry to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.parseadd
     */
    ParseAdd(input_) {
        if (!this.HasProp("__IHttpLanguageRangeWithQualityHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpLanguageRangeWithQualityHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpLanguageRangeWithQualityHeaderValueCollection := IHttpLanguageRangeWithQualityHeaderValueCollection(outPtr)
        }

        return this.__IHttpLanguageRangeWithQualityHeaderValueCollection.ParseAdd(input_)
    }

    /**
     * Tries to parse and add the specified item to the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @param {HSTRING} input_ The item to parse and add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.tryparseadd
     */
    TryParseAdd(input_) {
        if (!this.HasProp("__IHttpLanguageRangeWithQualityHeaderValueCollection")) {
            if ((queryResult := this.QueryInterface(IHttpLanguageRangeWithQualityHeaderValueCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpLanguageRangeWithQualityHeaderValueCollection := IHttpLanguageRangeWithQualityHeaderValueCollection(outPtr)
        }

        return this.__IHttpLanguageRangeWithQualityHeaderValueCollection.TryParseAdd(input_)
    }

    /**
     * Returns the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index of a specified item in the collection.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Returns an immutable view of the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of an [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) in the collection.
     * @param {Generic} value The [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) to find in the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) in the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) at the specified index in the collection.
     * @param {Integer} index The zero-based index at which to set the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md).
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts an [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) into the collection at the specified index.
     * @param {Integer} index The zero-based index at which *value* should be inserted.
     * @param {Generic} value The object to insert into the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the entry at the specified index from the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @param {Integer} index The index of the entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) item to the end of the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) item from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) items that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) items in the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) items that start at *startIndex* in the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) items in the collection with the specified [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) items to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b6df6da2-8d92-5270-9584-d6a9a931586d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) item in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{0c5a4a0d-dbb7-5abf-a5fd-c3b98d9c1487}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpLanguageRangeWithQualityHeaderValue, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervaluecollection.tostring
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
