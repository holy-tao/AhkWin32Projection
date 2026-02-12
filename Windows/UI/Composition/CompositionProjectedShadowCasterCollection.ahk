#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\CompositionProjectedShadowCaster.ahk
#Include .\ICompositionProjectedShadowCasterCollection.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\ICompositionProjectedShadowCasterCollectionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of CompositionProjectedShadowCaster objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionProjectedShadowCasterCollection extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionProjectedShadowCasterCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionProjectedShadowCasterCollection.IID

    /**
     * Gets the maximum number of shadow casters that will be respected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.maxrespectedcasters
     * @type {Integer} 
     */
    static MaxRespectedCasters {
        get => CompositionProjectedShadowCasterCollection.get_MaxRespectedCasters()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxRespectedCasters() {
        if (!CompositionProjectedShadowCasterCollection.HasProp("__ICompositionProjectedShadowCasterCollectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionProjectedShadowCasterCollection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionProjectedShadowCasterCollectionStatics.IID)
            CompositionProjectedShadowCasterCollection.__ICompositionProjectedShadowCasterCollectionStatics := ICompositionProjectedShadowCasterCollectionStatics(factoryPtr)
        }

        return CompositionProjectedShadowCasterCollection.__ICompositionProjectedShadowCasterCollectionStatics.get_MaxRespectedCasters()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.count
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.get_Count()
    }

    /**
     * Adds a CompositionProjectedShadowCaster to the collection above the specified item.
     * @param {CompositionProjectedShadowCaster} newCaster The CompositionProjectedShadowCaster to add to the collection.
     * @param {CompositionProjectedShadowCaster} reference_ The item to add _newCaster_ above.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.insertabove
     */
    InsertAbove(newCaster, reference_) {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.InsertAbove(newCaster, reference_)
    }

    /**
     * Adds a CompositionProjectedShadowCaster to the bottom of the collection.
     * @param {CompositionProjectedShadowCaster} newCaster The CompositionProjectedShadowCaster to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.insertatbottom
     */
    InsertAtBottom(newCaster) {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.InsertAtBottom(newCaster)
    }

    /**
     * Adds a CompositionProjectedShadowCaster to the top of the collection.
     * @param {CompositionProjectedShadowCaster} newCaster The CompositionProjectedShadowCaster to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.insertattop
     */
    InsertAtTop(newCaster) {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.InsertAtTop(newCaster)
    }

    /**
     * Adds a CompositionProjectedShadowCaster to the collection below the specified item.
     * @param {CompositionProjectedShadowCaster} newCaster The CompositionProjectedShadowCaster to add to the collection.
     * @param {CompositionProjectedShadowCaster} reference_ The item to add _newCaster_ below.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.insertbelow
     */
    InsertBelow(newCaster, reference_) {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.InsertBelow(newCaster, reference_)
    }

    /**
     * Removes the specified CompositionProjectedShadowCaster from the collection.
     * @param {CompositionProjectedShadowCaster} caster The CompositionProjectedShadowCaster to remove from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.remove
     */
    Remove(caster) {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.Remove(caster)
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__ICompositionProjectedShadowCasterCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCasterCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCasterCollection := ICompositionProjectedShadowCasterCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowCasterCollection.RemoveAll()
    }

    /**
     * Returns an iterator for the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcastercollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{b8301b02-429b-5d71-ab0c-8d1141b12ac3}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(CompositionProjectedShadowCaster, outPtr)
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
