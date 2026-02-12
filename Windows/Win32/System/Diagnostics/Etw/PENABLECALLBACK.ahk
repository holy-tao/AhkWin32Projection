#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * ETW event providers optionally define an EnableCallback function to receive configuration change notifications. The PENABLECALLBACK type defines a pointer to this callback function. EnableCallback is a placeholder for the application-defined function name.
 * @remarks
 * ETW event providers that need configuration change notifications should provide
 * a pointer to their **EnableCallback** implementation when they register via
 * [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister). ETW will
 * invoke the provider's **EnableCallback** function when a change is made to the
 * configuration of a trace session that involves the provider. For example, when a
 * trace session controller configures a trace via
 * [EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2) or
 * stops a trace via
 * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew), ETW will
 * call the provider's **EnableCallback** function with the resulting updated
 * configuration.
 * 
 * > [!Note]
 * > Most event providers will not implement **EnableCallback** directly. Instead,
 * > most event providers are implemented using an ETW framework that provides its
 * > own **EnableCallback** implementation and wraps the calls to
 * > **EventRegister**, **EventWrite**, and **EventUnregister**. For example, you
 * > might
 * > [write an event manifest](/windows/win32/etw/writing-manifest-based-events)
 * > and then use the
 * > [Message Compiler](/windows/win32/wes/message-compiler--mc-exe-) to generate
 * > C/C++ code for the events, or you might use
 * > [TraceLogging](/windows/win32/tracelogging/trace-logging-portal) to avoid the
 * > need for a manifest. The ETW framework typically implements an
 * > **EnableCallback** function that records the notification's `Level`,
 * > `MatchAnyKeyword`, and `MatchAllKeyword` values, and the framework
 * > automatically uses the recorded values to filter events. The ETW framework
 * > usually supports invoking a user-provided callback if the user requires custom
 * > notification handling. For example,
 * > [TraceLoggingProvider.h](/windows/win32/api/traceloggingprovider/) allows a
 * > notification callback to be specified via
 * > [TraceLoggingRegisterEx](/windows/win32/api/traceloggingprovider/nf-traceloggingprovider-traceloggingregisterex).
 * 
 * > [!Important]
 * > The provider's **EnableCallback** function should be as simple as
 * > possible. It should record the required information and return quickly. A
 * > long-running callback function can cause delays in ETW session control APIs such
 * > as **EnableTraceEx2** or **ControlTrace**. The callback function must not do
 * > anything that requires the process's loader lock, i.e. it must not directly or
 * > indirectly call **LoadLibrary** or **FreeLibrary**. The callback function must
 * > not block on locks. The callback function may cause a deadlock if it blocks on
 * > locks or if it invokes any ETW session control APIs such as **StartTrace**,
 * > **ControlTrace**, or **EnableTrace**.
 * 
 * The notification callback allows the event provider to run more efficiently
 * because the provider can perform its own tracking of the level, keywords, and
 * other filters. By tracking the filters, the provider can efficiently skip events
 * that are not enabled (i.e. the provider does not need to prepare the event data
 * or call **EventWrite** for events that are not needed by any trace sessions).
 * 
 * Note that filter tracking is not required for correct operation of a provider:
 * ETW provides
 * [EventEnabled](/windows/desktop/api/evntprov/nf-evntprov-eventenabled) and
 * [EventProviderEnabled](/windows/desktop/api/evntprov/nf-evntprov-eventproviderenabled)
 * functions that a provider can use, and the ETW **EventWrite** APIs will silently
 * ignore any disabled events. However, provider-implemented filter tracking can be
 * more efficient than calls to **EventEnabled** or **EventProviderEnabled**.
 * 
 * The notification callback also allows the provider to handle "capture-state"
 * requests from trace sessions. Capture-state requests are typically sent by a
 * trace session when it begins recording events from a provider. If capture-state
 * is supported by a provider, it might respond to the capture-state request by
 * logging state information, e.g. configuration information or summary statistics
 * regarding the component's operation prior to the request.
 * 
 * The _Level_ value that ETW passes to the callback is the highest (most verbose)
 * level value specified for this event provider by any running trace session. For
 * example, if session A has enabled this provider for warning (level 3) events and
 * then session B enables the provider for critical (level 1) events, the _Level_
 * value for the callback will be 3, not 1.
 * 
 * Similarly, the _MatchAnyKeyword_ and _MatchAllKeyword_ values are composite
 * values computed from the configuration of all sessions that have enabled the
 * event provider. _MatchAnyKeyword_ is the OR of the EnableFlags/MatchAnyKeyword
 * settings of the sessions. _MatchAllKeyword_ is the AND of the MatchAllKeyword
 * settings of the sessions.
 * 
 * If the provider's **EnableCallback** function has captured the provider's
 * Enabled, Level, MatchAnyKeyword, and MatchAllKeyword state, the provider can
 * determine whether an event should be written using a function like the
 * following:
 * 
 * ```c
 * BOOL MyProviderEventEnabled(
 *     _In_ const MY_PROVIDER_STATE* pProvider,
 *     _In_ const EVENT_DESCRIPTOR* pEvent)
 * {
 *     return
 *         pProvider->Enabled &&
 *         pEvent->Level <= pProvider->Level &&
 *         (pEvent->Keyword == 0 || (
 *             (pEvent->Keyword & pProvider->MatchAnyKeyword) != 0 &&
 *             (pEvent->Keyword & pProvider->MatchAllKeyword) == pProvider->MatchAllKeyword
 *         ));
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/evntprov/nc-evntprov-penablecallback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PENABLECALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Guid>} SourceId 
     * @param {Integer} IsEnabled 
     * @param {Integer} Level 
     * @param {Integer} MatchAnyKeyword 
     * @param {Integer} MatchAllKeyword 
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} FilterData 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SourceId, IsEnabled, Level, MatchAnyKeyword, MatchAllKeyword, FilterData, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", SourceId, "uint", IsEnabled, "char", Level, "uint", MatchAnyKeyword, "uint", MatchAllKeyword, "ptr", FilterData, CallbackContextMarshal, CallbackContext)
    }
}
