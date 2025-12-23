#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the threading behavior of a callback (for example, a WS_ASYNC_CALLBACK).
 * @remarks
 * Whether a callback will be invoked long or short is up to the caller implementation.
 *                 The channel and listener implementations provide a way to control this for async callbacks
 *                 via the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ASYNC_CALLBACK_MODEL</a> and 
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_ASYNC_CALLBACK_MODEL</a> properties.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_callback_model
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CALLBACK_MODEL extends Win32Enum{

    /**
     * This value is used to indicate that a callback is invoked short.
     *                 
     * 
     * When a callback is invoked short, it should avoid lengthy computation or lengthy
     *                     blocking calls so that it can return to the caller quickly.  During the time
     *                     that a callback is executing short, other work items may not be able to be
     *                     dequeued within the process.  This can lead to starvation deadlock, an
     *                     unresponsive system, or an underutilized system.
     *                 
     * 
     * If it is necessary to do IO within a callback that was invoked short, the best practice is
     *                     to use asynchronous IO (instead of synchronous IO), to avoid lengthy blocking calls.
     * @type {Integer (Int32)}
     */
    static WS_SHORT_CALLBACK => 0

    /**
     * This value is used to indicate that a callback is invoked long.
     *                 
     * 
     * A callback invoked long is not required to return to the caller quickly.
     *                 
     * 
     * However, long callbacks are a limited resource, so it is not always possible
     *                     to invoke a callback long.
     *                 
     * 
     * Before invoking a callback long, the caller must ensure that there is another thread
     *                     available to dequeue work as necessary.  For example, if a caller needs to create 
     *                     a thread but is unable to, then it must invoke the callback short.
     *                 
     * 
     * All callbacks must be able to deal with being invoked short as well as long:
     *                     <ul>
     * <li>A callback that is invoked short but requires long can interpret this as an
     *                         error condition, likely due to low resources.  For example, calling CreateThread or
     *                         QueueUserWorkItem in this situation is also likely to fail.  If a
     *                         callback is required to run long in a low resource situation, then a thread
     *                         for this purpose must be reserved prior to initiating the async operation.
     *                         </li>
     * <li>A callback that is invoked long but expects short can go about its work normally.
     *                     </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static WS_LONG_CALLBACK => 1
}
