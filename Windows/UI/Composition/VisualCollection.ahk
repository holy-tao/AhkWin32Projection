#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\Visual.ahk
#Include .\IVisualCollection.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of visual instances.
 * @remarks
 * VisualCollections are ordered from bottom to top and iterating or enumerating through a collection is always done from bottom to top.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class VisualCollection extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of visual instances in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.count
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
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.get_Count()
    }

    /**
     * Inserts a visual above the specified sibling visual in the visual collection.
     * @remarks
     * VisualCollections are ordered from bottom to top and iterating or enumerating through a collection is always done from bottom to top.
     * @param {Visual} newChild The new visual to insert.
     * @param {Visual} sibling The sibling to insert the visual above.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.insertabove
     */
    InsertAbove(newChild, sibling) {
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.InsertAbove(newChild, sibling)
    }

    /**
     * Inserts a new visual at the bottom of the visual collection.
     * @remarks
     * VisualCollections are ordered from bottom to top and iterating or enumerating through a collection is always done from bottom to top.
     * @param {Visual} newChild The new visual to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.insertatbottom
     */
    InsertAtBottom(newChild) {
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.InsertAtBottom(newChild)
    }

    /**
     * Inserts a new visual at the top of the visual collection.
     * @remarks
     * VisualCollections are ordered from bottom to top and iterating or enumerating through a collection is always done from bottom to top.
     * @param {Visual} newChild The new visual to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.insertattop
     */
    InsertAtTop(newChild) {
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.InsertAtTop(newChild)
    }

    /**
     * Insert a new visual below the specified visual in the visual collection.
     * @remarks
     * VisualCollections are ordered from bottom to top and iterating or enumerating through a collection is always done from bottom to top.
     * @param {Visual} newChild The new visual to insert.
     * @param {Visual} sibling The sibling visual to insert the new visual below.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.insertbelow
     */
    InsertBelow(newChild, sibling) {
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.InsertBelow(newChild, sibling)
    }

    /**
     * Removes the specified visual instance from the collection.
     * @param {Visual} child The specified visual instance from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.remove
     */
    Remove(child) {
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.Remove(child)
    }

    /**
     * Removes all of the visual instances from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__IVisualCollection")) {
            if ((queryResult := this.QueryInterface(IVisualCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualCollection := IVisualCollection(outPtr)
        }

        return this.__IVisualCollection.RemoveAll()
    }

    /**
     * Retrieves an iterator with the first object at the bottom of the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{4eed7dce-e4ac-5891-9b52-799d70df47fe}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(Visual, outPtr)
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
