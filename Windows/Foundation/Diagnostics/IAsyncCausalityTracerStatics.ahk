#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IAsyncCausalityTracerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncCausalityTracerStatics
     * @type {Guid}
     */
    static IID => Guid("{50850b26-267e-451b-a890-ab6a370245ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TraceOperationCreation", "TraceOperationCompletion", "TraceOperationRelation", "TraceSynchronousWorkStart", "TraceSynchronousWorkCompletion", "add_TracingStatusChanged", "remove_TracingStatusChanged"]

    /**
     * 
     * @param {Integer} traceLevel 
     * @param {Integer} source 
     * @param {Guid} platformId_ 
     * @param {Integer} operationId 
     * @param {HSTRING} operationName 
     * @param {Integer} relatedContext 
     * @returns {HRESULT} 
     */
    TraceOperationCreation(traceLevel, source, platformId_, operationId, operationName, relatedContext) {
        if(operationName is String) {
            pin := HSTRING.Create(operationName)
            operationName := pin.Value
        }
        operationName := operationName is Win32Handle ? NumGet(operationName, "ptr") : operationName

        result := ComCall(6, this, "int", traceLevel, "int", source, "ptr", platformId_, "uint", operationId, "ptr", operationName, "uint", relatedContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} traceLevel 
     * @param {Integer} source 
     * @param {Guid} platformId_ 
     * @param {Integer} operationId 
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     */
    TraceOperationCompletion(traceLevel, source, platformId_, operationId, status_) {
        result := ComCall(7, this, "int", traceLevel, "int", source, "ptr", platformId_, "uint", operationId, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} traceLevel 
     * @param {Integer} source 
     * @param {Guid} platformId_ 
     * @param {Integer} operationId 
     * @param {Integer} relation 
     * @returns {HRESULT} 
     */
    TraceOperationRelation(traceLevel, source, platformId_, operationId, relation) {
        result := ComCall(8, this, "int", traceLevel, "int", source, "ptr", platformId_, "uint", operationId, "int", relation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} traceLevel 
     * @param {Integer} source 
     * @param {Guid} platformId_ 
     * @param {Integer} operationId 
     * @param {Integer} work 
     * @returns {HRESULT} 
     */
    TraceSynchronousWorkStart(traceLevel, source, platformId_, operationId, work) {
        result := ComCall(9, this, "int", traceLevel, "int", source, "ptr", platformId_, "uint", operationId, "int", work, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} traceLevel 
     * @param {Integer} source 
     * @param {Integer} work 
     * @returns {HRESULT} 
     */
    TraceSynchronousWorkCompletion(traceLevel, source, work) {
        result := ComCall(10, this, "int", traceLevel, "int", source, "int", work, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<TracingStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TracingStatusChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TracingStatusChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(12, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
