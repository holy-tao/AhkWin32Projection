#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies attributes for a user-mode scheduling (UMS) worker thread.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-ums_create_thread_attributes
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class UMS_CREATE_THREAD_ATTRIBUTES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The UMS version for which the application was built. This parameter must be <b>UMS_VERSION</b>.
     * @type {Integer}
     */
    UmsVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a UMS thread context for the worker thread to be created. This pointer is provided by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createumsthreadcontext">CreateUmsThreadContext</a> function.
     * @type {Pointer<Void>}
     */
    UmsContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a UMS completion list. This pointer is provided by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createumscompletionlist">CreateUmsCompletionList</a> function. The newly created worker thread is queued to the specified completion list.
     * @type {Pointer<Void>}
     */
    UmsCompletionList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
