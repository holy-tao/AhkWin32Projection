#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Determines whether the copied call frame data can be shared with data in the parent frame by determining its lifetime dependency on the parent frame.
 * @remarks
 * A consequence is that whichever of these <b>CALLFRAME_COPY</b> flags are passed to <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframe-copy">ICallFrame::Copy</a>, the interface pointers can be modified without consequence of disturbing the interface pointers residing in the parent frame.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_copy
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAME_COPY extends Win32Enum{

    /**
     * The client will be responsible for using the copied call frame in a manner that its lifetime is nested in the lifetime of its parent frame making the data sharable. When this flag is used, very significant optimizations can be made and memory allocations avoided by cleverly sharing actual parameter data.
     * 
     * Only the interface pointers transitively reachable in the source frames are guaranteed to be deep copied and thus in the copy be stored in memory separate from that in which they are stored in the source frames; other data types may actually in the copied frame share memory with the source if the copy operation is intelligent enough to do so.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_COPY_NESTED => 1

    /**
     * The copied call frame will have a lifetime independent from its parent.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_COPY_INDEPENDENT => 2
}
