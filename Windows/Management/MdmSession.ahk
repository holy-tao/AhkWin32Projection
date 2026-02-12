#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMdmSession.ahk
#Include ..\..\Guid.ahk

/**
 * Provides functionality to start an MDM session with the server.
 * @remarks
 * Once a session is complete, the caller can determine the server's response to each alert from the client.  By default, sessions persist so clients can look up the results later.
 * 
 * Data from a session can be deleted by calling [MdmSession.Delete](mdmsession_delete_432759908.md) or [MdmSessionManager.DeleteSessionById](mdmsessionmanager_deletesessionbyid_612343759.md) once the session is complete.
 * 
 * > Note: MDM sessions are **not** abortable. If the caller cancels a session and starts a new one, the original sessions will continue in the background until it's complete. 
 * 
 * This API does not expose the server ID or enrollment.
 * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class MdmSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMdmSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMdmSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A vector list of all MdmAlerts for the current session.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.alerts
     * @type {IVectorView<MdmAlert>} 
     */
    Alerts {
        get => this.get_Alerts()
    }

    /**
     * The extended error code for an MDM session.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * The ID for the MDM session.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the state of an MDM session.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MdmAlert>} 
     */
    get_Alerts() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.get_Alerts()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.get_ExtendedError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.get_State()
    }

    /**
     * Allows the caller to re-open an existing MDM session.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.attachasync
     */
    AttachAsync() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.AttachAsync()
    }

    /**
     * Deletes the MDM session.
     * @remarks
     * If the session is currently running (in the background), you must wait for it to complete before you can delete it. 
     * 
     * Deleted sessions can't be tracked after this method returns.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.delete
     */
    Delete() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.Delete()
    }

    /**
     * Starts an MDM session with custom alerts.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.StartAsync()
    }

    /**
     * Start an MDM session with a constant alerts.
     * @remarks
     * This method can be used if you simply want to check-in with the MDM server.
     * @param {IIterable<MdmAlert>} alerts 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsession.startasync
     */
    StartWithAlertsAsync(alerts) {
        if (!this.HasProp("__IMdmSession")) {
            if ((queryResult := this.QueryInterface(IMdmSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmSession := IMdmSession(outPtr)
        }

        return this.__IMdmSession.StartWithAlertsAsync(alerts)
    }

;@endregion Instance Methods
}
