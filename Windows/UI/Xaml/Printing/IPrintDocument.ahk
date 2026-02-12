#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Printing\IPrintDocumentSource.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the progress of the print job.
 * @see https://learn.microsoft.com/windows/win32/api//content/documenttarget/nn-documenttarget-iprintdocumentpackagestatusevent
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintDocument extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintDocument
     * @type {Guid}
     */
    static IID => Guid("{e44327c3-a999-485b-b1d8-72dc517821e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DocumentSource", "add_Paginate", "remove_Paginate", "add_GetPreviewPage", "remove_GetPreviewPage", "add_AddPages", "remove_AddPages", "AddPage", "AddPagesComplete", "SetPreviewPageCount", "SetPreviewPage", "InvalidatePreview"]

    /**
     * @type {IPrintDocumentSource} 
     */
    DocumentSource {
        get => this.get_DocumentSource()
    }

    /**
     * 
     * @returns {IPrintDocumentSource} 
     */
    get_DocumentSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintDocumentSource(value)
    }

    /**
     * 
     * @param {PaginateEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Paginate(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Paginate(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GetPreviewPageEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GetPreviewPage(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GetPreviewPage(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AddPagesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AddPages(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AddPages(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a new instance of the [AddPagesEventArgs](addpageseventargs.md) class.
     * @param {UIElement} pageVisual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.addpageseventargs.#ctor
     */
    AddPage(pageVisual) {
        result := ComCall(13, this, "ptr", pageVisual, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddPagesComplete() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    SetPreviewPageCount(count, type) {
        result := ComCall(15, this, "int", count, "int", type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} pageNumber 
     * @param {UIElement} pageVisual 
     * @returns {HRESULT} 
     */
    SetPreviewPage(pageNumber, pageVisual) {
        result := ComCall(16, this, "int", pageNumber, "ptr", pageVisual, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidatePreview() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
