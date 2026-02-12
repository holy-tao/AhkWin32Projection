#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHtmlPrintDocumentSource.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the document source for app printing.
 * @remarks
 * To get an instance of HtmlPrintDocumentSource, call the [getHtmlPrintDocumentSource](/previous-versions/hh772325(v=vs.85))[MSApp](/previous-versions/hh772326(v=vs.85)) method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class HtmlPrintDocumentSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHtmlPrintDocumentSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHtmlPrintDocumentSource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the content of the document source to print.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.content
     * @type {Integer} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets and sets the left margin of the document source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.leftmargin
     * @type {Float} 
     */
    LeftMargin {
        get => this.get_LeftMargin()
        set => this.put_LeftMargin(value)
    }

    /**
     * Gets and sets the top margin of the document source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.topmargin
     * @type {Float} 
     */
    TopMargin {
        get => this.get_TopMargin()
        set => this.put_TopMargin(value)
    }

    /**
     * Gets and sets the right margin of the document source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.rightmargin
     * @type {Float} 
     */
    RightMargin {
        get => this.get_RightMargin()
        set => this.put_RightMargin(value)
    }

    /**
     * Gets and sets the bottom margin of the document source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.bottommargin
     * @type {Float} 
     */
    BottomMargin {
        get => this.get_BottomMargin()
        set => this.put_BottomMargin(value)
    }

    /**
     * Gets and sets a value that controls whether header and footer are enabled in the document source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.enableheaderfooter
     * @type {Boolean} 
     */
    EnableHeaderFooter {
        get => this.get_EnableHeaderFooter()
        set => this.put_EnableHeaderFooter(value)
    }

    /**
     * Gets and sets a value that controls whether content shrinks to fit the document source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.shrinktofit
     * @type {Boolean} 
     */
    ShrinkToFit {
        get => this.get_ShrinkToFit()
        set => this.put_ShrinkToFit(value)
    }

    /**
     * Gets and sets the size of the document source by percentage.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.percentscale
     * @type {Float} 
     */
    PercentScale {
        get => this.get_PercentScale()
        set => this.put_PercentScale(value)
    }

    /**
     * Gets the range of pages that prints.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.pagerange
     * @type {HSTRING} 
     */
    PageRange {
        get => this.get_PageRange()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Content() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_Content()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_Content(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftMargin() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_LeftMargin()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftMargin(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_LeftMargin(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopMargin() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_TopMargin()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TopMargin(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_TopMargin(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightMargin() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_RightMargin()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightMargin(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_RightMargin(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomMargin() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_BottomMargin()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BottomMargin(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_BottomMargin(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableHeaderFooter() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_EnableHeaderFooter()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableHeaderFooter(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_EnableHeaderFooter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShrinkToFit() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_ShrinkToFit()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShrinkToFit(value) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_ShrinkToFit(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PercentScale() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_PercentScale()
    }

    /**
     * 
     * @param {Float} scalePercent 
     * @returns {HRESULT} 
     */
    put_PercentScale(scalePercent) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.put_PercentScale(scalePercent)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PageRange() {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.get_PageRange()
    }

    /**
     * Tries to set the page range of the document source.
     * @param {HSTRING} strPageRange The page range to set.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.trysetpagerange
     */
    TrySetPageRange(strPageRange) {
        if (!this.HasProp("__IHtmlPrintDocumentSource")) {
            if ((queryResult := this.QueryInterface(IHtmlPrintDocumentSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHtmlPrintDocumentSource := IHtmlPrintDocumentSource(outPtr)
        }

        return this.__IHtmlPrintDocumentSource.TrySetPageRange(strPageRange)
    }

    /**
     * Performs app-defined tasks that are associated with freeing, releasing, or resetting resources that were allocated for the document source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.htmlprintdocumentsource.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
