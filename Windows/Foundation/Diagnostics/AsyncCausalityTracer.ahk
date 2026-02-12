#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAsyncCausalityTracerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables tracing control flow across asynchronous operations.
 * @remarks
 * The AsyncCausalityTracer class provides methods that enable creating, propagating, and tracking causality as control flows across asynchronous operations. The causality is an abstraction for tracking both asynchronous and synchronous activities. You can use the collected data to develop causality graphs that are useful for debugging. Causality tracing uses event tracing for Windows (ETW) for logging.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.asynccausalitytracer
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class AsyncCausalityTracer extends IInspectable {
;@region Static Methods
    /**
     * Logs the creation of an asynchronous operation.
     * @remarks
     * Use the TraceOperationCreation method to log the creation of an asynchronous operation. An asynchronous operation represents a group of zero or more related synchronous work items that may be scheduled in an asynchronous way. Each asynchronous operation has a 128-bit [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies the operation type, like BCL task and WinJS Promise, and a **UInt64** operation identifier that must be unique within the platform for the lifetime of the asynchronous operation. Good choices for *operationId* include a native pointer to an underlying object, or an integer that's incremented for each new operation. The *operationName* should be a human readable description of the asynchronous work. The *relatedContext* associates any additional information related to this operation.
     * @param {Integer} traceLevel The trace level.
     * @param {Integer} source The trace source.
     * @param {Guid} platformId_ Identifier for the operation type.
     * @param {Integer} operationId An identifier for the asynchronous operation that's unique within the platform for the operation's lifetime.
     * @param {HSTRING} operationName A human-readable description of the asynchronous work.
     * @param {Integer} relatedContext Additional information related to this operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.asynccausalitytracer.traceoperationcreation
     */
    static TraceOperationCreation(traceLevel, source, platformId_, operationId, operationName, relatedContext) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.TraceOperationCreation(traceLevel, source, platformId_, operationId, operationName, relatedContext)
    }

    /**
     * Indicates that a previously created asynchronous operation has completed all of its asynchronous work.
     * @remarks
     * This function is used to indicate that a previously created asynchronous operation has completed all of its asynchronous work. The only work that the operation may schedule after logging completion is its completion continuation. The *operationId* and *platformId* parameters must match an asynchronous operation that was previously logged by a call to the [TraceOperationCreation](asynccausalitytracer_traceoperationcreation_1939304732.md) method.
     * @param {Integer} traceLevel The trace level.
     * @param {Integer} source The trace source.
     * @param {Guid} platformId_ Identifier for the operation type.
     * @param {Integer} operationId The identifier for the asynchronous operation that's unique within the platform for the operation's lifetime.
     * @param {Integer} status_ The completion status of the asynchronous operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.asynccausalitytracer.traceoperationcompletion
     */
    static TraceOperationCompletion(traceLevel, source, platformId_, operationId, status_) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.TraceOperationCompletion(traceLevel, source, platformId_, operationId, status_)
    }

    /**
     * Logs the relation between the currently running synchronous work item and a specific asynchronous operation that it's related to.
     * @remarks
     * Causality relations track ways that synchronous work items may interact with asynchronous operations.
     * @param {Integer} traceLevel The trace level.
     * @param {Integer} source The trace source.
     * @param {Guid} platformId_ Identifier for the operation type.
     * @param {Integer} operationId The identifier for the asynchronous operation that's unique within the platform for the operation's lifetime.
     * @param {Integer} relation The relationship between the synchronous work item and asynchronous operation identified by *operationId*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.asynccausalitytracer.traceoperationrelation
     */
    static TraceOperationRelation(traceLevel, source, platformId_, operationId, relation) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.TraceOperationRelation(traceLevel, source, platformId_, operationId, relation)
    }

    /**
     * Indicates that the specified asynchronous operation is scheduling synchronous work on the thread that the TraceSynchronousWorkStart method is called on.
     * @param {Integer} traceLevel The trace level.
     * @param {Integer} source The trace source.
     * @param {Guid} platformId_ Identifier for the operation type.
     * @param {Integer} operationId The identifier for the asynchronous operation that's unique within the platform for the operation's lifetime.
     * @param {Integer} work The relationship between the work item and the asynchronous operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.asynccausalitytracer.tracesynchronousworkstart
     */
    static TraceSynchronousWorkStart(traceLevel, source, platformId_, operationId, work) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.TraceSynchronousWorkStart(traceLevel, source, platformId_, operationId, work)
    }

    /**
     * Indicates that the most recently created synchronous work item running on the thread that the TraceSynchronousWorkCompletion method is called on has completed.
     * @param {Integer} traceLevel The trace level.
     * @param {Integer} source The trace source.
     * @param {Integer} work Indicates the type of completion.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.asynccausalitytracer.tracesynchronousworkcompletion
     */
    static TraceSynchronousWorkCompletion(traceLevel, source, work) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.TraceSynchronousWorkCompletion(traceLevel, source, work)
    }

    /**
     * 
     * @param {EventHandler<TracingStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_TracingStatusChanged(handler) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.add_TracingStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_TracingStatusChanged(cookie) {
        if (!AsyncCausalityTracer.HasProp("__IAsyncCausalityTracerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.AsyncCausalityTracer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsyncCausalityTracerStatics.IID)
            AsyncCausalityTracer.__IAsyncCausalityTracerStatics := IAsyncCausalityTracerStatics(factoryPtr)
        }

        return AsyncCausalityTracer.__IAsyncCausalityTracerStatics.remove_TracingStatusChanged(cookie)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
