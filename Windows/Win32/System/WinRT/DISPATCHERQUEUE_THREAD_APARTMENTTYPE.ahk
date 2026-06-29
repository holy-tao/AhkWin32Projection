#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the threading apartment type for a new DispatcherQueueController.
 * @remarks
 * This value is relevant when <a href="https://docs.microsoft.com/windows/desktop/api/dispatcherqueue/ns-dispatcherqueue-dispatcherqueueoptions">DispatcherQueueOptions.threadType</a> is  <b>DQTYPE_THREAD_DEDICATED</b>. Use <b>DQTAT_COM_NONE</b> when <b>DispatcherQueueOptions.threadType</b> is <b>DQTYPE_THREAD_CURRENT</b>.
 * 
 * Introduced in Windows 10, version 1709.
 * @see https://learn.microsoft.com/windows/win32/api/dispatcherqueue/ne-dispatcherqueue-dispatcherqueue_thread_apartmenttype
 * @namespace Windows.Win32.System.WinRT
 */
export default struct DISPATCHERQUEUE_THREAD_APARTMENTTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
