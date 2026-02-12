#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintPageRangeOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the print page range options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerangeoptions
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintPageRangeOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintPageRangeOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintPageRangeOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the allow all pages option of the print page range.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerangeoptions.allowallpages
     * @type {Boolean} 
     */
    AllowAllPages {
        get => this.get_AllowAllPages()
        set => this.put_AllowAllPages(value)
    }

    /**
     * Gets and sets the allow current page option of the print page range.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerangeoptions.allowcurrentpage
     * @type {Boolean} 
     */
    AllowCurrentPage {
        get => this.get_AllowCurrentPage()
        set => this.put_AllowCurrentPage(value)
    }

    /**
     * Gets and sets the allow custom set of pages option for the print page range.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagerangeoptions.allowcustomsetofpages
     * @type {Boolean} 
     */
    AllowCustomSetOfPages {
        get => this.get_AllowCustomSetOfPages()
        set => this.put_AllowCustomSetOfPages(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowAllPages(value) {
        if (!this.HasProp("__IPrintPageRangeOptions")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptions := IPrintPageRangeOptions(outPtr)
        }

        return this.__IPrintPageRangeOptions.put_AllowAllPages(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowAllPages() {
        if (!this.HasProp("__IPrintPageRangeOptions")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptions := IPrintPageRangeOptions(outPtr)
        }

        return this.__IPrintPageRangeOptions.get_AllowAllPages()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowCurrentPage(value) {
        if (!this.HasProp("__IPrintPageRangeOptions")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptions := IPrintPageRangeOptions(outPtr)
        }

        return this.__IPrintPageRangeOptions.put_AllowCurrentPage(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCurrentPage() {
        if (!this.HasProp("__IPrintPageRangeOptions")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptions := IPrintPageRangeOptions(outPtr)
        }

        return this.__IPrintPageRangeOptions.get_AllowCurrentPage()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowCustomSetOfPages(value) {
        if (!this.HasProp("__IPrintPageRangeOptions")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptions := IPrintPageRangeOptions(outPtr)
        }

        return this.__IPrintPageRangeOptions.put_AllowCustomSetOfPages(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCustomSetOfPages() {
        if (!this.HasProp("__IPrintPageRangeOptions")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptions := IPrintPageRangeOptions(outPtr)
        }

        return this.__IPrintPageRangeOptions.get_AllowCustomSetOfPages()
    }

;@endregion Instance Methods
}
