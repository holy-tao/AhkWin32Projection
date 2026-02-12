#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IItemIndexRange.ahk
#Include .\IItemIndexRangeFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info about a range of items in the data source.
 * @remarks
 * The ItemIndexRange class supports virtualization of large data sources for efficient presentation by XAML list controls. The other classes and interfaces that support data source virtualization are the following.
 * 
 * 
 * + [IItemsRangeInfo](iitemsrangeinfo.md) interface
 * + [ISelectionInfo](iselectioninfo.md) interface
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.itemindexrange
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ItemIndexRange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemIndexRange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemIndexRange.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} firstIndex 
     * @param {Integer} length 
     * @returns {ItemIndexRange} 
     */
    static CreateInstance(firstIndex, length) {
        if (!ItemIndexRange.HasProp("__IItemIndexRangeFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.ItemIndexRange")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemIndexRangeFactory.IID)
            ItemIndexRange.__IItemIndexRangeFactory := IItemIndexRangeFactory(factoryPtr)
        }

        return ItemIndexRange.__IItemIndexRangeFactory.CreateInstance(firstIndex, length, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the index of the first item in the instance of the [ItemIndexRange](itemindexrange.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.itemindexrange.firstindex
     * @type {Integer} 
     */
    FirstIndex {
        get => this.get_FirstIndex()
    }

    /**
     * Gets the number of items in the instance of the [ItemIndexRange](itemindexrange.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.itemindexrange.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets the index of the last item in the instance of the [ItemIndexRange](itemindexrange.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.itemindexrange.lastindex
     * @type {Integer} 
     */
    LastIndex {
        get => this.get_LastIndex()
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
    get_FirstIndex() {
        if (!this.HasProp("__IItemIndexRange")) {
            if ((queryResult := this.QueryInterface(IItemIndexRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemIndexRange := IItemIndexRange(outPtr)
        }

        return this.__IItemIndexRange.get_FirstIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IItemIndexRange")) {
            if ((queryResult := this.QueryInterface(IItemIndexRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemIndexRange := IItemIndexRange(outPtr)
        }

        return this.__IItemIndexRange.get_Length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastIndex() {
        if (!this.HasProp("__IItemIndexRange")) {
            if ((queryResult := this.QueryInterface(IItemIndexRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemIndexRange := IItemIndexRange(outPtr)
        }

        return this.__IItemIndexRange.get_LastIndex()
    }

;@endregion Instance Methods
}
