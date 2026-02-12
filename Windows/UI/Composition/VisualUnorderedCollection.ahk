#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\Visual.ahk
#Include .\IVisualUnorderedCollection.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * An unordered collection of visuals.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualunorderedcollection
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class VisualUnorderedCollection extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualUnorderedCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualUnorderedCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The number of visuals in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualunorderedcollection.count
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
        if (!this.HasProp("__IVisualUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(IVisualUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualUnorderedCollection := IVisualUnorderedCollection(outPtr)
        }

        return this.__IVisualUnorderedCollection.get_Count()
    }

    /**
     * Adds a visual to the collection.
     * @param {Visual} newVisual The visual to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualunorderedcollection.add
     */
    Add(newVisual) {
        if (!this.HasProp("__IVisualUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(IVisualUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualUnorderedCollection := IVisualUnorderedCollection(outPtr)
        }

        return this.__IVisualUnorderedCollection.Add(newVisual)
    }

    /**
     * Removes a visual from the collection.
     * @param {Visual} visual_ Removes a visual from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualunorderedcollection.remove
     */
    Remove(visual_) {
        if (!this.HasProp("__IVisualUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(IVisualUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualUnorderedCollection := IVisualUnorderedCollection(outPtr)
        }

        return this.__IVisualUnorderedCollection.Remove(visual_)
    }

    /**
     * Removes all visuals from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualunorderedcollection.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__IVisualUnorderedCollection")) {
            if ((queryResult := this.QueryInterface(IVisualUnorderedCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualUnorderedCollection := IVisualUnorderedCollection(outPtr)
        }

        return this.__IVisualUnorderedCollection.RemoveAll()
    }

    /**
     * Retrieves the first visual in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visualunorderedcollection.first
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
