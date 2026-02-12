#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExtendedExecutionForegroundSession.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ExtendedExecutionForegroundRevokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Supports managing a request for extended execution. This API requires the use of restricted capabilities and cannot be used for Store applications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundsession
 * @namespace Windows.ApplicationModel.ExtendedExecution.Foreground
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionForegroundSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExtendedExecutionForegroundSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExtendedExecutionForegroundSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a string to display in the shell.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundsession.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets the reason for the extended execution request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundsession.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
        set => this.put_Reason(value)
    }

    /**
     * This event occurs when the system revokes extended execution.
     * @type {TypedEventHandler<IInspectable, ExtendedExecutionForegroundRevokedEventArgs>}
    */
    OnRevoked {
        get {
            if(!this.HasProp("__OnRevoked")){
                this.__OnRevoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f874197a-bf19-5482-9ab1-34923de6738d}"),
                    IInspectable,
                    ExtendedExecutionForegroundRevokedEventArgs
                )
                this.__OnRevokedToken := this.add_Revoked(this.__OnRevoked.iface)
            }
            return this.__OnRevoked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an [ExtendedExecutionForegroundSession](extendedexecutionforegroundsession.md) object
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundSession")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRevokedToken")) {
            this.remove_Revoked(this.__OnRevokedToken)
            this.__OnRevoked.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.put_Description(value)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, ExtendedExecutionForegroundRevokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Revoked(handler) {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.add_Revoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Revoked(token) {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.remove_Revoked(token)
    }

    /**
     * Requests extended execution
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundsession.requestextensionasync
     */
    RequestExtensionAsync() {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.RequestExtensionAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.get_Reason()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Reason(value) {
        if (!this.HasProp("__IExtendedExecutionForegroundSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundSession := IExtendedExecutionForegroundSession(outPtr)
        }

        return this.__IExtendedExecutionForegroundSession.put_Reason(value)
    }

    /**
     * Closes the session and removes the application's extended execution capability.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundsession.close
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
