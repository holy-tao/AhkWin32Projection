#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the threading apartment type for a new DispatcherQueueController.
 * @remarks
 * This value is relevant when <a href="https://docs.microsoft.com/windows/desktop/api/dispatcherqueue/ns-dispatcherqueue-dispatcherqueueoptions">DispatcherQueueOptions.threadType</a> is  <b>DQTYPE_THREAD_DEDICATED</b>. Use <b>DQTAT_COM_NONE</b> when <b>DispatcherQueueOptions.threadType</b> is <b>DQTYPE_THREAD_CURRENT</b>.
 * 
 * Introduced in Windows 10, version 1709.
 * @see https://learn.microsoft.com/windows/win32/api/dispatcherqueue/ne-dispatcherqueue-dispatcherqueue_thread_apartmenttype
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class DISPATCHERQUEUE_THREAD_APARTMENTTYPE extends Win32Enum{

    /**
     * No COM threading apartment type specified.
     * @type {Integer (Int32)}
     */
    static DQTAT_COM_NONE => 0

    /**
     * Specifies an application single-threaded apartment (ASTA) COM threading apartment.
     * @type {Integer (Int32)}
     */
    static DQTAT_COM_ASTA => 1

    /**
     * Specifies a single-threaded apartment (STA) COM threading apartment.
     * @type {Integer (Int32)}
     */
    static DQTAT_COM_STA => 2
}
