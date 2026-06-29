#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a table of pointers to service provider upcall functions.
 * @remarks
 * The **WSPUPCALLTABLE** structure contains a table of pointers to service provider upcall functions that are passed to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wspupcalltable
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSPUPCALLTABLE {
    #StructPack 8

    /**
     * Type: **LPWPUCLOSEEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpucloseevent">WPUCloseEvent</a> function.
     */
    lpWPUCloseEvent : IntPtr

    /**
     * Type: **LPWPUCLOSESOCKETHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuclosesockethandle">WPUCloseSocketHandle</a> function.
     */
    lpWPUCloseSocketHandle : IntPtr

    /**
     * Type: **LPWPUCREATEEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpucreateevent">WPUCreateEvent</a> function.
     */
    lpWPUCreateEvent : IntPtr

    /**
     * Type: **LPWPUCREATESOCKETHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpucreatesockethandle">WPUCreateSocketHandle</a> function.
     */
    lpWPUCreateSocketHandle : IntPtr

    /**
     * Type: **LPWPUFDISSET**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpufdisset">WPUFDIsSet</a> function.
     */
    lpWPUFDIsSet : IntPtr

    /**
     * Type: **LPWPUGETPROVIDERPATH**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpugetproviderpath">WPUGetProviderPath</a> function.
     */
    lpWPUGetProviderPath : IntPtr

    /**
     * Type: **LPWPUMODIFYIFSHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpumodifyifshandle">WPUModifyIFSHandle</a> function.
     */
    lpWPUModifyIFSHandle : IntPtr

    /**
     * Type: **LPWPUPOSTMESSAGE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpupostmessage">WPUPostMessage</a> function.
     */
    lpWPUPostMessage : IntPtr

    /**
     * Type: **LPWPUQUERYBLOCKINGCALLBACK**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuqueryblockingcallback">WPUQueryBlockingCallback</a> function.
     */
    lpWPUQueryBlockingCallback : IntPtr

    /**
     * Type: **LPWPUQUERYSOCKETHANDLECONTEXT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuquerysockethandlecontext">WPUQuerySocketHandleContext</a> function.
     */
    lpWPUQuerySocketHandleContext : IntPtr

    /**
     * Type: **LPWPUQUEUEAPC**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a> function.
     */
    lpWPUQueueApc : IntPtr

    /**
     * Type: **LPWPURESETEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuresetevent">WPUResetEvent</a> function.
     */
    lpWPUResetEvent : IntPtr

    /**
     * Type: **LPWPUSETEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpusetevent">WPUSetEvent</a> function.
     */
    lpWPUSetEvent : IntPtr

    /**
     * Type: **LPWPUOPENCURRENTTHREAD**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuopencurrentthread">WPUOpenCurrentThread</a> function.
     */
    lpWPUOpenCurrentThread : IntPtr

    /**
     * Type: **LPWPUCLOSETHREAD**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuclosethread">WPUCloseThread</a> function.
     */
    lpWPUCloseThread : IntPtr

}
