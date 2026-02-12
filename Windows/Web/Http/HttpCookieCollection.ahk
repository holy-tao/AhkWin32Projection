#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\HttpCookie.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a collection container for instances of the [HttpCookie](httpcookie.md) class.
 * @remarks
 * The [GetCookies](httpcookiemanager_getcookies_1465382103.md) method on [HttpCookieManager](httpcookiemanager.md) returns an HttpCookieCollection object. This is the method that an HttpCookieCollection is constructed.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiecollection
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpCookieCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVectorView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVectorView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of cookies in the [HttpCookieCollection](httpcookiecollection.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiecollection.size
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
     * Returns the [HttpCookie](httpcookie.md) at the specified index from the [HttpCookieCollection](httpcookiecollection.md).
     * @param {Integer} index The zero-based index of a specified item in the [HttpCookieCollection](httpcookiecollection.md).
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0064c4f6-3fca-5823-9d92-86c40b28adbc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(HttpCookie, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0064c4f6-3fca-5823-9d92-86c40b28adbc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(HttpCookie, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index of an [HttpCookie](httpcookie.md) in the [HttpCookieCollection](httpcookiecollection.md).
     * @param {Generic} value The [HttpCookie](httpcookie.md) to find in the [HttpCookieCollection](httpcookiecollection.md).
     * @param {Pointer<UInt32>} index The index of the [HttpCookie](httpcookie.md) in the [HttpCookieCollection](httpcookiecollection.md).
     * 
     * If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0064c4f6-3fca-5823-9d92-86c40b28adbc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(HttpCookie, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves the [HttpCookie](httpcookie.md) items that start at the specified index in the [HttpCookieCollection](httpcookiecollection.md).
     * @param {Integer} startIndex The zero-based index of the start of the [HttpCookie](httpcookie.md) items in the [HttpCookieCollection](httpcookiecollection.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The [HttpCookie](httpcookie.md) items that start at *startIndex* in the [HttpCookieCollection](httpcookiecollection.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0064c4f6-3fca-5823-9d92-86c40b28adbc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(HttpCookie, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Retrieves an iterator to the first [HttpCookie](httpcookie.md) item in the [HttpCookieCollection](httpcookiecollection.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{0eb9fa36-88de-590d-8ea0-b613d0ab015f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HttpCookie, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
