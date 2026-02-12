#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ICompositionInteractionSource.ahk
#Include .\ICompositionInteractionSourceCollection.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of interaction sources.
  * 
  * This is the collection of interaction sources that are associated with a given [InteractionTracker](interactiontracker.md). The only valid member of this collection is a [VisualInteractionSource](visualinteractionsource.md). Each [VisualInteractionSource](visualinteractionsource.md) needs to have a unique hit-test (source) visual. Each [VisualInteractionSource](visualinteractionsource.md) will be configured individually for the desired input to be sent to the [InteractionTracker](interactiontracker.md).
 * @remarks
 * While multiple CompositionInteractionSources can be added to the same CompositionInteractionSourceCollection the most common case is to only have one member in this collection. Multiple can be used if multiple hit-test regions should drive the same [InteractionTracker](interactiontracker.md). If multiple source visuals are hit-test at the same time the visual tree hierarchy will determine which one takes precedence. If any common parent contains more hit-test contacts than a single child, the input will be promoted to that parent.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositioninteractionsourcecollection
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class CompositionInteractionSourceCollection extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionInteractionSourceCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionInteractionSourceCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The number of interaction sources in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositioninteractionsourcecollection.count
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
        if (!this.HasProp("__ICompositionInteractionSourceCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionInteractionSourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionInteractionSourceCollection := ICompositionInteractionSourceCollection(outPtr)
        }

        return this.__ICompositionInteractionSourceCollection.get_Count()
    }

    /**
     * Adds an interaction source to the collection.
     * @param {ICompositionInteractionSource} value The interaction source to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositioninteractionsourcecollection.add
     */
    Add(value) {
        if (!this.HasProp("__ICompositionInteractionSourceCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionInteractionSourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionInteractionSourceCollection := ICompositionInteractionSourceCollection(outPtr)
        }

        return this.__ICompositionInteractionSourceCollection.Add(value)
    }

    /**
     * Removes the specified interaction source from the collection.
     * @param {ICompositionInteractionSource} value The interaction source to remove from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositioninteractionsourcecollection.remove
     */
    Remove(value) {
        if (!this.HasProp("__ICompositionInteractionSourceCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionInteractionSourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionInteractionSourceCollection := ICompositionInteractionSourceCollection(outPtr)
        }

        return this.__ICompositionInteractionSourceCollection.Remove(value)
    }

    /**
     * Removes all interaction sources from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositioninteractionsourcecollection.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__ICompositionInteractionSourceCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionInteractionSourceCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionInteractionSourceCollection := ICompositionInteractionSourceCollection(outPtr)
        }

        return this.__ICompositionInteractionSourceCollection.RemoveAll()
    }

    /**
     * Returns an iterator pointing to the first object in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositioninteractionsourcecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{17c50e21-cb70-5a2b-b797-a8dc01a99113}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(ICompositionInteractionSource, outPtr)
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
