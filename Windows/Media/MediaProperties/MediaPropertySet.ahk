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
 * Represents a set of media properties.
 * @remarks
 * This object is not instantiated directly, it is returned by retrieving one of the following properties:
 * + [AudioEncodingProperties.Properties](audioencodingproperties_properties.md)
 * + [ContainerEncodingProperties.Properties](containerencodingproperties_properties.md)
 * + [ImageEncodingProperties.Properties](imediaencodingproperties_properties.md)
 * + [VideoEncodingProperties.Properties](videoencodingproperties_properties.md)
 * + [IMediaEncodingProperties.Properties](imediaencodingproperties_properties.md)
 * 
 * 
 * For information on working with a property set collection, see [PropertySet](../windows.foundation.collections/propertyset.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaPropertySet extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.size
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
    /**
     * Creates an instance for [MediaPropertySet](mediapropertyset.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaPropertySet")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Retrieves the value for the specified key.
     * @param {Generic} key The key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.lookup
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
     * Indicates whether the property set has an item with the specified key.
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.haskey
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
     * Returns an immutable view of the property set.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.getview
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
     * Adds an item to the property set.
     * @param {Generic} key The key of the item to insert.
     * @param {Generic} value The value of the item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.insert
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
     * @remarks
     * For the C# and Microsoft Visual Basic version of the **Remove(Guid)** method, see [Remove](/uwp/api/windows.media.mediaproperties.mediapropertyset.remove).
     * @param {Generic} key The key of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.remove
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.clear
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapropertyset.first
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
