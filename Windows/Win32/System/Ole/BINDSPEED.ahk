#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates approximately how long the caller will wait to bind to an object.
 * @remarks
 * The system-supplied item moniker implementation is the primary caller of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>. The <b>BINDSPEED</b> value that it specifies depends on the deadline specified by the caller of the moniker operation. 
 * 
 * 
 * 
 * The deadline is stored in the <b>dwTickCountDeadline</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure in the bind context passed to the moniker operation. This value is based on the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-gettickcount">GetTickCount</a> function. If <i>dwTickCountDeadline</i> is zero, indicating no deadline, the item moniker implementation specifies BINDSPEED_INDEFINITE. (This is the default <i>dwTickCountDeadline</i> value for a bind context returned by the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function.) If the difference between <i>dwTickCountDeadline</i> and the value returned by <b>GetTickCount</b> is greater than 2500, the item moniker implementation specifies BINDSPEED_MODERATE. If the difference is less than 2500, the item moniker implementation specifies BINDSPEED_IMMEDIATE.
 * 
 * Implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">GetObject</a> can use the <b>BINDSPEED</b> value as a shortcut approximation of the binding deadline, or they can use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> instance parameter to determine the exact deadline.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-bindspeed
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class BINDSPEED extends Win32Enum{

    /**
     * There is no time limit on the binding operation.
     * @type {Integer (Int32)}
     */
    static BINDSPEED_INDEFINITE => 1

    /**
     * The binding operation must be completed in a moderate amount of time. 
     * 
     * If this flag is specified, the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a> should return MK_E_EXCEEEDEDDEADLINE unless tone of the following is true:
     * 
     * <ul>
     * <li>The object is already in the running state.
     * </li>
     * <li>The object is a pseudo-object (an object internal to the item container, such as a cell-range in a spreadsheet or a character-range in a word processor).</li>
     * <li>The object is supported by an in-process server (so it is always in the running state when it is loaded). In this case, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">GetObject</a> should load the designated object, and, if the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleisrunning">OleIsRunning</a> function indicates that the object is running, return successfully. 
     * </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static BINDSPEED_MODERATE => 2

    /**
     * The caller will wait only a short time. In this case, the binding operation should return MK_E_EXCEEEDEDDEADLINE unless the object is already in the running state or is a pseudo-object.
     * @type {Integer (Int32)}
     */
    static BINDSPEED_IMMEDIATE => 3
}
