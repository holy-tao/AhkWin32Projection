#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintPageRange.ahk
#Include .\IPrintPageRangeFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the range of pages in a print task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerange
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintPageRange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintPageRange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintPageRange.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [PrintPageRange](printpagerange.md) class, using the specified first and last page numbers.
     * @param {Integer} firstPage The first page number of the print range.
     * @param {Integer} lastPage The last page number of the print range.
     * @returns {PrintPageRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerange.#ctor
     */
    static Create(firstPage, lastPage) {
        if (!PrintPageRange.HasProp("__IPrintPageRangeFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintPageRange")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintPageRangeFactory.IID)
            PrintPageRange.__IPrintPageRangeFactory := IPrintPageRangeFactory(factoryPtr)
        }

        return PrintPageRange.__IPrintPageRangeFactory.Create(firstPage, lastPage)
    }

    /**
     * Initializes an instance of the [PrintPageRange](printpagerange.md) class, using the specified page number.
     * @param {Integer} page_ The page number of the print range.
     * @returns {PrintPageRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerange.#ctor
     */
    static CreateWithSinglePage(page_) {
        if (!PrintPageRange.HasProp("__IPrintPageRangeFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintPageRange")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintPageRangeFactory.IID)
            PrintPageRange.__IPrintPageRangeFactory := IPrintPageRangeFactory(factoryPtr)
        }

        return PrintPageRange.__IPrintPageRangeFactory.CreateWithSinglePage(page_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the first page number of the print range.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerange.firstpagenumber
     * @type {Integer} 
     */
    FirstPageNumber {
        get => this.get_FirstPageNumber()
    }

    /**
     * Gets the last page number of the print range.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerange.lastpagenumber
     * @type {Integer} 
     */
    LastPageNumber {
        get => this.get_LastPageNumber()
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
    get_FirstPageNumber() {
        if (!this.HasProp("__IPrintPageRange")) {
            if ((queryResult := this.QueryInterface(IPrintPageRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRange := IPrintPageRange(outPtr)
        }

        return this.__IPrintPageRange.get_FirstPageNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastPageNumber() {
        if (!this.HasProp("__IPrintPageRange")) {
            if ((queryResult := this.QueryInterface(IPrintPageRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRange := IPrintPageRange(outPtr)
        }

        return this.__IPrintPageRange.get_LastPageNumber()
    }

;@endregion Instance Methods
}
