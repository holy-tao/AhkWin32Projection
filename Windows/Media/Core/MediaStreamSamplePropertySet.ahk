#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains properties for the [MediaStreamSample](mediastreamsample.md).
 * @remarks
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a Universal Windows app.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSamplePropertySet extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of items contained in the property set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the value for the specified key.
     * @param {Generic} key The key to retrieve the value for.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Indicates if the specified key exists in the property set.
     * @param {Generic} key The key to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Gets an immutable view of the property set.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Adds the specified key and value to the property set.
     * @param {Generic} key The key to add.
     * @param {Generic} value The value of the key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes an item from the property set.
     * @param {Generic} key The key to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from the property set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{5ee3189c-7dbf-5998-ad07-5414fb82567c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns an iterator to enumerate the items in the property set.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsamplepropertyset.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{f3b20528-e3b3-5331-b2d0-0c2623aee785}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => IPropertyValue(ptr).GetGuid(), IInspectable), outPtr)
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
