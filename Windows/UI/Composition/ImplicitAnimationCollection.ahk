#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\ICompositionAnimationBase.ahk
#Include .\IImplicitAnimationCollection.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Guid.ahk

/**
 * A collection of animations triggered when a condition is met.
 * @remarks
 * Implicit animations let you drive animations by specifying trigger conditions rather than requiring the manual definition of animation behavior. They help decouple animation start logic from core app logic. You define animations and the events that should trigger these animations. The compositor then executes the set animations when the appropriate trigger conditions are met.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ImplicitAnimationCollection extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImplicitAnimationCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImplicitAnimationCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The size of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.size
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
     * Retrieves the first animation in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{c739c420-64b2-53f2-89b9-05906aba7cb0}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase), outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Retrieves the animation associated with the specified property.
     * @param {Generic} key The property to lookup.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Returns a boolean indicating whether the collection contains the specified key.
     * @param {Generic} key The key to check for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Returns a map view of the collection.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Inserts an animation into the collection.
     * @param {Generic} key The property the animation affects.
     * @param {Generic} value The animation to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes the specified animation from the collection.
     * @param {Generic} key The property the animation is assigned to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all animations from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.implicitanimationcollection.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{4ba9aa1d-57ac-54de-a807-b52e689bfc04}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), ICompositionAnimationBase, outPtr)
        }

        return this.__IMap.Clear()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
