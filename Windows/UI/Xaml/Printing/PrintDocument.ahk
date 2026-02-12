#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IPrintDocument.ahk
#Include .\IPrintDocumentStatics.ahk
#Include .\IPrintDocumentFactory.ahk
#Include .\PaginateEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\PaginateEventArgs.ahk
#Include .\GetPreviewPageEventHandler.ahk
#Include .\GetPreviewPageEventArgs.ahk
#Include .\AddPagesEventHandler.ahk
#Include .\AddPagesEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Defines a reusable object that sends output to a printer.
 * @remarks
 * [PrintDocument](printdocument_printdocument_1221375020.md) implements a print list concept whereby pages can be added to the print list, and then various methods can be called on the ongoing print list.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class PrintDocument extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintDocument

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintDocument.IID

    /**
     * Identifies the [DocumentSource](printdocument_documentsource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.documentsourceproperty
     * @type {DependencyProperty} 
     */
    static DocumentSourceProperty {
        get => PrintDocument.get_DocumentSourceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DocumentSourceProperty() {
        if (!PrintDocument.HasProp("__IPrintDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Printing.PrintDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintDocumentStatics.IID)
            PrintDocument.__IPrintDocumentStatics := IPrintDocumentStatics(factoryPtr)
        }

        return PrintDocument.__IPrintDocumentStatics.get_DocumentSourceProperty()
    }

    /**
     * 
     * @returns {PrintDocument} 
     */
    static CreateInstance() {
        if (!PrintDocument.HasProp("__IPrintDocumentFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Printing.PrintDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintDocumentFactory.IID)
            PrintDocument.__IPrintDocumentFactory := IPrintDocumentFactory(factoryPtr)
        }

        return PrintDocument.__IPrintDocumentFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a document source reference for this [PrintDocument](printdocument.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.documentsource
     * @type {IPrintDocumentSource} 
     */
    DocumentSource {
        get => this.get_DocumentSource()
    }

    /**
     * Occurs when the [PrintManager](../windows.graphics.printing/printmanager.md) requests the collection of print pages to be shown in the preview window.
     * @type {PaginateEventHandler}
    */
    OnPaginate {
        get {
            if(!this.HasProp("__OnPaginate")){
                this.__OnPaginate := WinRTEventHandler(
                    PaginateEventHandler,
                    PaginateEventHandler.IID,
                    IInspectable,
                    PaginateEventArgs
                )
                this.__OnPaginateToken := this.add_Paginate(this.__OnPaginate.iface)
            }
            return this.__OnPaginate
        }
    }

    /**
     * Occurs when the [PrintManager](../windows.graphics.printing/printmanager.md) requests a particular print page to be shown in the preview window.
     * @remarks
     * In the handler for this event, call [SetPreviewPage](printdocument_setpreviewpage_550154265.md) to set the requested page as the current print preview page.
     * @type {GetPreviewPageEventHandler}
    */
    OnGetPreviewPage {
        get {
            if(!this.HasProp("__OnGetPreviewPage")){
                this.__OnGetPreviewPage := WinRTEventHandler(
                    GetPreviewPageEventHandler,
                    GetPreviewPageEventHandler.IID,
                    IInspectable,
                    GetPreviewPageEventArgs
                )
                this.__OnGetPreviewPageToken := this.add_GetPreviewPage(this.__OnGetPreviewPage.iface)
            }
            return this.__OnGetPreviewPage
        }
    }

    /**
     * Occurs when the [PrintManager](../windows.graphics.printing/printmanager.md) requests the final collection of pages to send to the printer.
     * @remarks
     * Provide Windows with printable pages by calling [AddPage](printdocument_addpage_533744783.md) for each page to be printed. Pass a [UIElement](../windows.ui.xaml/uielement.md) that is the printable content to the [AddPage](printdocument_addpage_533744783.md) method. Call [AddPagesComplete](printdocument_addpagescomplete_260689112.md) to signal that all of the pages to be printed have been added and Windows can continue with the print job.
     * 
     * If the user specifies particular pages or a range of pages in the print options UI, only the specified pages should be added to the print list.
     * 
     * <!--Add link when content is ready: For more info, see How to add page range settings to a UWP app print window. (This is the JS title, might want to shorten it a little.) -->
     * @type {AddPagesEventHandler}
    */
    OnAddPages {
        get {
            if(!this.HasProp("__OnAddPages")){
                this.__OnAddPages := WinRTEventHandler(
                    AddPagesEventHandler,
                    AddPagesEventHandler.IID,
                    IInspectable,
                    AddPagesEventArgs
                )
                this.__OnAddPagesToken := this.add_AddPages(this.__OnAddPages.iface)
            }
            return this.__OnAddPages
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPaginateToken")) {
            this.remove_Paginate(this.__OnPaginateToken)
            this.__OnPaginate.iface.Dispose()
        }

        if(this.HasProp("__OnGetPreviewPageToken")) {
            this.remove_GetPreviewPage(this.__OnGetPreviewPageToken)
            this.__OnGetPreviewPage.iface.Dispose()
        }

        if(this.HasProp("__OnAddPagesToken")) {
            this.remove_AddPages(this.__OnAddPagesToken)
            this.__OnAddPages.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IPrintDocumentSource} 
     */
    get_DocumentSource() {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.get_DocumentSource()
    }

    /**
     * 
     * @param {PaginateEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Paginate(handler) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.add_Paginate(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Paginate(token) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.remove_Paginate(token)
    }

    /**
     * 
     * @param {GetPreviewPageEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GetPreviewPage(handler) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.add_GetPreviewPage(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GetPreviewPage(token) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.remove_GetPreviewPage(token)
    }

    /**
     * 
     * @param {AddPagesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AddPages(handler) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.add_AddPages(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AddPages(token) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.remove_AddPages(token)
    }

    /**
     * Adds a XAML root visual element to the print list.
     * @param {UIElement} pageVisual The root visual element of the page to add to the print list.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.addpage
     */
    AddPage(pageVisual) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.AddPage(pageVisual)
    }

    /**
     * Indicates that the application will not add more pages to the print list, and that the print list is ready to be released.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.addpagescomplete
     */
    AddPagesComplete() {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.AddPagesComplete()
    }

    /**
     * Sets the number of pages prepared for print preview and added to the print list.
     * @param {Integer} count The number of pages included in the preview.
     * @param {Integer} type A value of the enumeration that specifies how to determine the page count.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.setpreviewpagecount
     */
    SetPreviewPageCount(count, type) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.SetPreviewPageCount(count, type)
    }

    /**
     * Sets the specified print page as the current print preview page.
     * @param {Integer} pageNumber The sequence number of the page to preview.
     * @param {UIElement} pageVisual The root visual object for the requested print page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.setpreviewpage
     */
    SetPreviewPage(pageNumber, pageVisual) {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.SetPreviewPage(pageNumber, pageVisual)
    }

    /**
     * References the low-level print preview dialog API and invalidates the current print preview.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.printdocument.invalidatepreview
     */
    InvalidatePreview() {
        if (!this.HasProp("__IPrintDocument")) {
            if ((queryResult := this.QueryInterface(IPrintDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintDocument := IPrintDocument(outPtr)
        }

        return this.__IPrintDocument.InvalidatePreview()
    }

;@endregion Instance Methods
}
