#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the threading and apartment type for a new DispatcherQueueController.
 * @remarks
 * 
  * Introduced in Windows 10, version 1709.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dispatcherqueue/ns-dispatcherqueue-dispatcherqueueoptions
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class DispatcherQueueOptions extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Size of this <b>DispatcherQueueOptions</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Thread affinity for the created <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a>.
     * @type {Integer}
     */
    threadType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether to initialize COM apartment on the new thread as an application single-threaded apartment (ASTA)  or single-threaded apartment (STA). This field is only relevant if <b>threadType</b> is <b>DQTYPE_THREAD_DEDICATED</b>. Use <b>DQTAT_COM_NONE</b> when <b>DispatcherQueueOptions.threadType</b> is <b>DQTYPE_THREAD_CURRENT</b>.
     * @type {Integer}
     */
    apartmentType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
