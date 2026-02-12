#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\IsolatedWindowsEnvironmentCreateResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IsolatedWindowsEnvironment.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironmentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironmentFactory
     * @type {Guid}
     */
    static IID => Guid("{1aca93e7-e804-454d-8466-f9897c20b0f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAsync", "CreateWithTelemetryAsync", "GetById", "FindByOwnerId"]

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {IsolatedWindowsEnvironmentOptions} options 
     * @returns {IAsyncOperationWithProgress<IsolatedWindowsEnvironmentCreateResult, IsolatedWindowsEnvironmentCreateProgress>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateAsync(options) {
        result := ComCall(6, this, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IsolatedWindowsEnvironmentCreateResult, (ptr) => IPropertyValue(ptr).GetIsolatedWindowsEnvironmentCreateProgress(), operation)
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {IsolatedWindowsEnvironmentOptions} options 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperationWithProgress<IsolatedWindowsEnvironmentCreateResult, IsolatedWindowsEnvironmentCreateProgress>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateWithTelemetryAsync(options, telemetryParameters) {
        result := ComCall(7, this, "ptr", options, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IsolatedWindowsEnvironmentCreateResult, (ptr) => IPropertyValue(ptr).GetIsolatedWindowsEnvironmentCreateProgress(), operation)
    }

    /**
     * 
     * @param {HSTRING} environmentId 
     * @returns {IsolatedWindowsEnvironment} 
     */
    GetById(environmentId) {
        if(environmentId is String) {
            pin := HSTRING.Create(environmentId)
            environmentId := pin.Value
        }
        environmentId := environmentId is Win32Handle ? NumGet(environmentId, "ptr") : environmentId

        result := ComCall(8, this, "ptr", environmentId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsolatedWindowsEnvironment(result_)
    }

    /**
     * 
     * @param {HSTRING} environmentOwnerId 
     * @returns {IVectorView<IsolatedWindowsEnvironment>} 
     */
    FindByOwnerId(environmentOwnerId) {
        if(environmentOwnerId is String) {
            pin := HSTRING.Create(environmentOwnerId)
            environmentOwnerId := pin.Value
        }
        environmentOwnerId := environmentOwnerId is Win32Handle ? NumGet(environmentOwnerId, "ptr") : environmentOwnerId

        result := ComCall(9, this, "ptr", environmentOwnerId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IsolatedWindowsEnvironment, result_)
    }
}
