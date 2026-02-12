#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneObject.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\ISceneMeshMaterialAttributeMap.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a collection of material attributes for a scene mesh as key/value pairs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneMeshMaterialAttributeMap extends SceneObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneMeshMaterialAttributeMap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneMeshMaterialAttributeMap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of items in the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.size
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
     * Returns the item at the specified key in the map.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Determines whether the map contains the specified key.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Returns an immutable view of the map.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Inserts or replaces an item in the map.
     * @param {Generic} key The key associated with the item to insert.
     * @param {Generic} value The item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes an item from the map.
     * @param {Generic} key The key associated with the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from the map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{41f50f14-9a3c-5240-b042-1bff02e57028}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns an iterator for the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshmaterialattributemap.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{a3e30221-7ca2-5a3c-a54a-378fee7369cc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32()), outPtr)
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
