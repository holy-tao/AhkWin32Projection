#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrinterExtensionRequest.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IPrinterExtensionContext.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionEventArgs extends IPrinterExtensionContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionEventArgs
     * @type {Guid}
     */
    static IID => Guid("{39843bf4-c4d2-41fd-b4b2-aedbee5e1900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BidiNotification", "get_ReasonId", "get_Request", "get_SourceApplication", "get_DetailedReasonId", "get_WindowModal", "get_WindowParent"]

    /**
     * @type {BSTR} 
     */
    BidiNotification {
        get => this.get_BidiNotification()
    }

    /**
     * @type {Guid} 
     */
    ReasonId {
        get => this.get_ReasonId()
    }

    /**
     * @type {IPrinterExtensionRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {BSTR} 
     */
    SourceApplication {
        get => this.get_SourceApplication()
    }

    /**
     * @type {Guid} 
     */
    DetailedReasonId {
        get => this.get_DetailedReasonId()
    }

    /**
     * @type {BOOL} 
     */
    WindowModal {
        get => this.get_WindowModal()
    }

    /**
     * @type {HANDLE} 
     */
    WindowParent {
        get => this.get_WindowParent()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BidiNotification() {
        pbstrBidiNotification := BSTR()
        result := ComCall(11, this, "ptr", pbstrBidiNotification, "HRESULT")
        return pbstrBidiNotification
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ReasonId() {
        pReasonId := Guid()
        result := ComCall(12, this, "ptr", pReasonId, "HRESULT")
        return pReasonId
    }

    /**
     * 
     * @returns {IPrinterExtensionRequest} 
     */
    get_Request() {
        result := ComCall(13, this, "ptr*", &ppRequest := 0, "HRESULT")
        return IPrinterExtensionRequest(ppRequest)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SourceApplication() {
        pbstrApplication := BSTR()
        result := ComCall(14, this, "ptr", pbstrApplication, "HRESULT")
        return pbstrApplication
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DetailedReasonId() {
        pDetailedReasonId := Guid()
        result := ComCall(15, this, "ptr", pDetailedReasonId, "HRESULT")
        return pDetailedReasonId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_WindowModal() {
        result := ComCall(16, this, "int*", &pbModal := 0, "HRESULT")
        return pbModal
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    get_WindowParent() {
        phwndParent := HANDLE()
        result := ComCall(17, this, "ptr", phwndParent, "HRESULT")
        return phwndParent
    }
}
