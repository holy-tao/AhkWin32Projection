#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExtendedExecutionSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ExtendedExecutionRevokedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports managing a request for background execution. For more information on how to use Extended Execution, see [Run while minimized with Extended Execution](/windows/uwp/launch-resume/run-minimized-with-extended-execution)
 * @remarks
 * The amount of time available to perform background execution may be several minutes, but you must be prepared to handle the session being revoked at any time.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession
 * @namespace Windows.ApplicationModel.ExtendedExecution
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExtendedExecutionSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExtendedExecutionSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the reason for the for the background execution request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
        set => this.put_Reason(value)
    }

    /**
     * This property is not used in the current release.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * This property is not used in the current release.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession.percentprogress
     * @type {Integer} 
     */
    PercentProgress {
        get => this.get_PercentProgress()
        set => this.put_PercentProgress(value)
    }

    /**
     * The **Revoked** event occurs when the system revokes background execution.
     * @remarks
     * The sender (**object**) is **null ** for this event.
     * @type {TypedEventHandler<IInspectable, ExtendedExecutionRevokedEventArgs>}
    */
    OnRevoked {
        get {
            if(!this.HasProp("__OnRevoked")){
                this.__OnRevoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b6d68d9c-9546-50b3-8af6-9c985a372ba8}"),
                    IInspectable,
                    ExtendedExecutionRevokedEventArgs
                )
                this.__OnRevokedToken := this.add_Revoked(this.__OnRevoked.iface)
            }
            return this.__OnRevoked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an **ExtendedExecutionSession** object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionSession")
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
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.get_Reason()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Reason(value) {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.put_Reason(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.put_Description(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PercentProgress() {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.get_PercentProgress()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PercentProgress(value) {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.put_PercentProgress(value)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, ExtendedExecutionRevokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Revoked(handler) {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.add_Revoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Revoked(token) {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.remove_Revoked(token)
    }

    /**
     * Requests background execution.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession.requestextensionasync
     */
    RequestExtensionAsync() {
        if (!this.HasProp("__IExtendedExecutionSession")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionSession := IExtendedExecutionSession(outPtr)
        }

        return this.__IExtendedExecutionSession.RequestExtensionAsync()
    }

    /**
     * Closes the session and removes the application's capability to run in the background.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession.close
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
