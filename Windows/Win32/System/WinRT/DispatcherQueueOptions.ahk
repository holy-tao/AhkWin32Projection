#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPATCHERQUEUE_THREAD_TYPE.ahk" { DISPATCHERQUEUE_THREAD_TYPE }
#Import ".\DISPATCHERQUEUE_THREAD_APARTMENTTYPE.ahk" { DISPATCHERQUEUE_THREAD_APARTMENTTYPE }

/**
 * Specifies the threading and apartment type for a new DispatcherQueueController.
 * @remarks
 * Introduced in Windows 10, version 1709.
 * @see https://learn.microsoft.com/windows/win32/api/dispatcherqueue/ns-dispatcherqueue-dispatcherqueueoptions
 * @namespace Windows.Win32.System.WinRT
 */
export default struct DispatcherQueueOptions {
    #StructPack 4

    /**
     * Size of this <b>DispatcherQueueOptions</b> structure.
     */
    dwSize : UInt32

    /**
     * Thread affinity for the created <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a>.
     */
    threadType : DISPATCHERQUEUE_THREAD_TYPE

    /**
     * Specifies whether to initialize COM apartment on the new thread as an application single-threaded apartment (ASTA)  or single-threaded apartment (STA). This field is only relevant if <b>threadType</b> is <b>DQTYPE_THREAD_DEDICATED</b>. Use <b>DQTAT_COM_NONE</b> when <b>DispatcherQueueOptions.threadType</b> is <b>DQTYPE_THREAD_CURRENT</b>.
     */
    apartmentType : DISPATCHERQUEUE_THREAD_APARTMENTTYPE

}
