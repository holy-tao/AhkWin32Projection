#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\CompositionProjectedShadowReceiver.ahk
#Include .\ICompositionProjectedShadowReceiverUnorderedCollection.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an unordered collection of CompositionProjectedShadowReceiver objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiverunorderedcollection
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionProjectedShadowReceiverUnorderedCollection extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionProjectedShadowReceiverUnorderedCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionProjectedShadowReceiverUnorderedCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiverunorderedcollection.count
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
     * Adds the specified CompositionProjectedShadowReceiver to the collection.
     * @param {CompositionProjectedShadowReceiver} value The item to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiverunorderedcollection.add
     */
    Add(value) {
        if (!this.HasProp("__ICompositionProjectedShadowReceiverUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowReceiverUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowReceiverUnorderedCollection := ICompositionProjectedShadowReceiverUnorderedCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowReceiverUnorderedCollection.Add(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        if (!this.HasProp("__ICompositionProjectedShadowReceiverUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowReceiverUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowReceiverUnorderedCollection := ICompositionProjectedShadowReceiverUnorderedCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowReceiverUnorderedCollection.get_Count()
    }

    /**
     * Removes the specified CompositionProjectedShadowReceiver from the collection.
     * @param {CompositionProjectedShadowReceiver} value The CompositionProjectedShadowReceiver to remove from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiverunorderedcollection.remove
     */
    Remove(value) {
        if (!this.HasProp("__ICompositionProjectedShadowReceiverUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowReceiverUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowReceiverUnorderedCollection := ICompositionProjectedShadowReceiverUnorderedCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowReceiverUnorderedCollection.Remove(value)
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiverunorderedcollection.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__ICompositionProjectedShadowReceiverUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowReceiverUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowReceiverUnorderedCollection := ICompositionProjectedShadowReceiverUnorderedCollection(outPtr)
        }

        return this.__ICompositionProjectedShadowReceiverUnorderedCollection.RemoveAll()
    }

    /**
     * Returns an iterator for the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowreceiverunorderedcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{e2775a28-ec48-5cb8-b352-76f7f981d7a4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(CompositionProjectedShadowReceiver, outPtr)
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
