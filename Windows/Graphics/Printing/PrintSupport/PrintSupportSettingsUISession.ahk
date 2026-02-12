#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportSettingsUISession.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a session of the print support settings UI.
 * @remarks
 * To create a print support settings UI extension, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportSettingsUI** in its package manifest. When the app is activated, the `OnActivated` method receives a [PrintSupportSettingsActivatedEventArgs](printsupportsettingsactivatedeventargs.md) object that provides access to information about the print support UI session. The [Session](printsupportsettingsactivatedeventargs_session.md) property of that object returns a **PrintSupportSettingsUISession** object.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsuisession
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportSettingsUISession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportSettingsUISession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportSettingsUISession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the print ticket for the current session. The print ticket contains instructions on how the printer should set its various features for a printing task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsuisession.sessionprintticket
     * @type {WorkflowPrintTicket} 
     */
    SessionPrintTicket {
        get => this.get_SessionPrintTicket()
    }

    /**
     * Gets the title of the document that is being printed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsuisession.documenttitle
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * Gets a value that indicates the type of operation that launched the print support settings UI.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsuisession.launchkind
     * @type {Integer} 
     */
    LaunchKind {
        get => this.get_LaunchKind()
    }

    /**
     * Gets an object that provides information about the current session of the print support settings UI.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsuisession.sessioninfo
     * @type {PrintSupportSessionInfo} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_SessionPrintTicket() {
        if (!this.HasProp("__IPrintSupportSettingsUISession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsUISession := IPrintSupportSettingsUISession(outPtr)
        }

        return this.__IPrintSupportSettingsUISession.get_SessionPrintTicket()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentTitle() {
        if (!this.HasProp("__IPrintSupportSettingsUISession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsUISession := IPrintSupportSettingsUISession(outPtr)
        }

        return this.__IPrintSupportSettingsUISession.get_DocumentTitle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaunchKind() {
        if (!this.HasProp("__IPrintSupportSettingsUISession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsUISession := IPrintSupportSettingsUISession(outPtr)
        }

        return this.__IPrintSupportSettingsUISession.get_LaunchKind()
    }

    /**
     * Updates the print ticket for the current session with the information in the specified print ticket object.
     * @remarks
     * The print ticket contains instructions on how the printer should set its various features for a printing task.
     * @param {WorkflowPrintTicket} printTicket The object that contains the new print ticket information.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsuisession.updateprintticket
     */
    UpdatePrintTicket(printTicket) {
        if (!this.HasProp("__IPrintSupportSettingsUISession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsUISession := IPrintSupportSettingsUISession(outPtr)
        }

        return this.__IPrintSupportSettingsUISession.UpdatePrintTicket(printTicket)
    }

    /**
     * 
     * @returns {PrintSupportSessionInfo} 
     */
    get_SessionInfo() {
        if (!this.HasProp("__IPrintSupportSettingsUISession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsUISession := IPrintSupportSettingsUISession(outPtr)
        }

        return this.__IPrintSupportSettingsUISession.get_SessionInfo()
    }

;@endregion Instance Methods
}
