#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPropertyValue.ahk
#Include .\IWwwFormUrlDecoderEntry.ahk
#Include .\IWwwFormUrlDecoderRuntimeClass.ahk
#Include Collections\IVectorView.ahk
#Include Collections\IIterable.ahk
#Include .\IWwwFormUrlDecoderRuntimeClassFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Parses a URL query string, and exposes the results as a read-only vector (list) of name-value pairs from the query string.
 * @remarks
 * Use the WwwFormUrlDecoder class to parse a query string into name-value pairs, based on the number and placement of "&" and "=" symbols. Each name-value pair is represented by an [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) object, which has a [Name](wwwformurldecoderentry_name.md) property and a [Value](ireferencearray_1_value.md) property (both strings).
 * 
 * Use [GetFirstValueByName](wwwformurldecoder_getfirstvaluebyname_186006860.md) to find a specific named query string parameter. All languages can use this method. You'd typically use [GetFirstValueByName](wwwformurldecoder_getfirstvaluebyname_186006860.md) rather than [GetAt](wwwformurldecoder_getat_496709656.md) because the order of items in a query string usually isn't important, whereas the parameter name is the important identifier of the parts of a query. Or, if you're not sure what names exist in the query string, you might enumerate over the complete WwwFormUrlDecoder collection.
 * 
 * The [Uri.QueryParsed](uri_queryparsed.md) property returns a complete WwwFormUrlDecoder based on a [Uri](uri.md) instance. So if you're using Visual C++ component extensions (C++/CX) or JavaScript code, and you already have a [Uri](uri.md) instance, you won't need to construct a new WwwFormUrlDecoder object, the [Uri](uri.md) instance already has one. You might construct a WwwFormUrlDecoder if you have a string representing a URL or its query string component from other sources, such as from a [Windows.Web.Http](../windows.web.http/windows_web_http.md) API.
 * 
 * > [!NOTE]
 * > This collection is a vector rather than a map in case the original order has any meaning to an implementation, and also because it's legal for the same name to appear in the query string twice, whereas it's not legal for maps to have duplicate keys.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class WwwFormUrlDecoder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWwwFormUrlDecoderRuntimeClass

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWwwFormUrlDecoderRuntimeClass.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the [WwwFormUrlDecoder](wwwformurldecoder.md) class.
     * @remarks
     * The query string must start with a '?' character.
     * 
     * Any '&amp;' character encountered represents a new name-value pair. If there is a '=' character present in the string, the substring to the left of the '=' character is the name and the right substring is the value.
     * 
     * The constructor doesn't do much validation on the string beyond verifying that it isn't **null** or the wrong type. If your input doesn't correctly represent a query string that starts with '?' and contains name-value pairs separated by '&amp;', the collection contents are empty or invalid, and calls to [GetFirstValueByName](wwwformurldecoder_getfirstvaluebyname_186006860.md) won't have the expected result.
     * 
     * URL-encoded characters are automatically decoded before the value is added to a name-value pair.
     * @param {HSTRING} query The URL to parse.
     * @returns {WwwFormUrlDecoder} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.#ctor
     */
    static CreateWwwFormUrlDecoder(query) {
        if (!WwwFormUrlDecoder.HasProp("__IWwwFormUrlDecoderRuntimeClassFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.WwwFormUrlDecoder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWwwFormUrlDecoderRuntimeClassFactory.IID)
            WwwFormUrlDecoder.__IWwwFormUrlDecoderRuntimeClassFactory := IWwwFormUrlDecoderRuntimeClassFactory(factoryPtr)
        }

        return WwwFormUrlDecoder.__IWwwFormUrlDecoderRuntimeClassFactory.CreateWwwFormUrlDecoder(query)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the number of the name-value pairs in the current URL query string.
     * @remarks
     * Name-value pairs are represented by [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.size
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
     * Gets the first name-value pair that has the specified name, as obtained from the constructing Uniform Resource Identifier (URI) query string.
     * @remarks
     * This method throws an exception (an error for JavaScript) if the value specified as name doesn't exist in the [WwwFormUrlDecoder](wwwformurldecoder.md) collection. For .NET code, this is typed as **System.ArgumentException**. You'll probably want to call GetFirstValueByName within a **try-catch** block so you have a chance to handle the exception.
     * 
     * What to do with duplicate names in a query string from a GET request is not specified by any Internet standard. A common practice is to process the first value and ignore the subsequent duplicates. The GetFirstValueByName method provides that behavior. It also provides the de-facto "index by string" behavior, which is typically what you want when you're processing a query string. Your app is expecting certain names to be present on the query string, and wants to retrieve the associated value.
     * @param {HSTRING} name The name of the value to get.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.getfirstvaluebyname
     */
    GetFirstValueByName(name) {
        if (!this.HasProp("__IWwwFormUrlDecoderRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IWwwFormUrlDecoderRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwwFormUrlDecoderRuntimeClass := IWwwFormUrlDecoderRuntimeClass(outPtr)
        }

        return this.__IWwwFormUrlDecoderRuntimeClass.GetFirstValueByName(name)
    }

    /**
     * Gets the name-value pair at the specified index in the current URL query string.
     * @param {Integer} index The index of the name-value pair.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b1f00d3b-1f06-5117-93ea-2a0d79116701}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IWwwFormUrlDecoderEntry, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b1f00d3b-1f06-5117-93ea-2a0d79116701}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IWwwFormUrlDecoderEntry, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Gets a value indicating whether the specified [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) is at the specified index in the current URL query string.
     * @param {Generic} value The name-value pair to get the index of.
     * @param {Pointer<UInt32>} index The position in *value*.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b1f00d3b-1f06-5117-93ea-2a0d79116701}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IWwwFormUrlDecoderEntry, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Gets name-value pairs starting at the specified index in the current URL query string.
     * @param {Integer} startIndex The index to start getting name-value pairs at.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The name-value pairs.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b1f00d3b-1f06-5117-93ea-2a0d79116701}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(IWwwFormUrlDecoderEntry, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Gets an iterator that represents the first name-value pair in the current URL query string.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoder.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{876be83b-7218-5bfb-a169-83152ef7e146}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IWwwFormUrlDecoderEntry, outPtr)
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
