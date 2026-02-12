#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDiagnosticProvider.ahk
#Include .\IHttpDiagnosticProviderStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\HttpDiagnosticProvider.ahk
#Include .\HttpDiagnosticProviderRequestSentEventArgs.ahk
#Include .\HttpDiagnosticProviderResponseReceivedEventArgs.ahk
#Include .\HttpDiagnosticProviderRequestResponseCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a simple diagnostic facility for tracing and profiling web traffic in applications built on Microsoft’s HTTP stacks.
 * @remarks
 * An instance of HttpDiagnosticProvider is returned from the [CreateFromProcessDiagnosticInfo](httpdiagnosticprovider_createfromprocessdiagnosticinfo_1892887646.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticprovider
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDiagnosticProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDiagnosticProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [HttpDiagnosticProvider](httpdiagnosticprovider.md) based on the specified [ProcessDiagnosticInfo](../windows.system.diagnostics/processdiagnosticinfo.md) object.
     * @param {ProcessDiagnosticInfo} processDiagnosticInfo_ The [ProcessDiagnosticInfo](../windows.system.diagnostics/processdiagnosticinfo.md) that identifies the process to watch.
     * @returns {HttpDiagnosticProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticprovider.createfromprocessdiagnosticinfo
     */
    static CreateFromProcessDiagnosticInfo(processDiagnosticInfo_) {
        if (!HttpDiagnosticProvider.HasProp("__IHttpDiagnosticProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Diagnostics.HttpDiagnosticProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpDiagnosticProviderStatics.IID)
            HttpDiagnosticProvider.__IHttpDiagnosticProviderStatics := IHttpDiagnosticProviderStatics(factoryPtr)
        }

        return HttpDiagnosticProvider.__IHttpDiagnosticProviderStatics.CreateFromProcessDiagnosticInfo(processDiagnosticInfo_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRequestSentToken")) {
            this.remove_RequestSent(this.__OnRequestSentToken)
            this.__OnRequestSent.iface.Dispose()
        }

        if(this.HasProp("__OnResponseReceivedToken")) {
            this.remove_ResponseReceived(this.__OnResponseReceivedToken)
            this.__OnResponseReceived.iface.Dispose()
        }

        if(this.HasProp("__OnRequestResponseCompletedToken")) {
            this.remove_RequestResponseCompleted(this.__OnRequestResponseCompletedToken)
            this.__OnRequestResponseCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts the [HttpDiagnosticProvider](httpdiagnosticprovider.md) monitoring the attached process target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticprovider.start
     */
    Start() {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.Start()
    }

    /**
     * Stops the [HttpDiagnosticProvider](httpdiagnosticprovider.md) from monitoring the attached process target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticprovider.stop
     */
    Stop() {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<HttpDiagnosticProvider, HttpDiagnosticProviderRequestSentEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RequestSent(handler) {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.add_RequestSent(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RequestSent(token) {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.remove_RequestSent(token)
    }

    /**
     * 
     * @param {TypedEventHandler<HttpDiagnosticProvider, HttpDiagnosticProviderResponseReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResponseReceived(handler) {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.add_ResponseReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ResponseReceived(token) {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.remove_ResponseReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<HttpDiagnosticProvider, HttpDiagnosticProviderRequestResponseCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RequestResponseCompleted(handler) {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.add_RequestResponseCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RequestResponseCompleted(token) {
        if (!this.HasProp("__IHttpDiagnosticProvider")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProvider := IHttpDiagnosticProvider(outPtr)
        }

        return this.__IHttpDiagnosticProvider.remove_RequestResponseCompleted(token)
    }

;@endregion Instance Methods
}
