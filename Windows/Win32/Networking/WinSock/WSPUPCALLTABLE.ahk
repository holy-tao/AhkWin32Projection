#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPWPUCLOSEEVENT.ahk" { LPWPUCLOSEEVENT }
#Import ".\LPWPUCLOSESOCKETHANDLE.ahk" { LPWPUCLOSESOCKETHANDLE }
#Import ".\LPWPUCLOSETHREAD.ahk" { LPWPUCLOSETHREAD }
#Import ".\LPWPUCREATEEVENT.ahk" { LPWPUCREATEEVENT }
#Import ".\LPWPUCREATESOCKETHANDLE.ahk" { LPWPUCREATESOCKETHANDLE }
#Import ".\LPWPUFDISSET.ahk" { LPWPUFDISSET }
#Import ".\LPWPUGETPROVIDERPATH.ahk" { LPWPUGETPROVIDERPATH }
#Import ".\LPWPUMODIFYIFSHANDLE.ahk" { LPWPUMODIFYIFSHANDLE }
#Import ".\LPWPUOPENCURRENTTHREAD.ahk" { LPWPUOPENCURRENTTHREAD }
#Import ".\LPWPUPOSTMESSAGE.ahk" { LPWPUPOSTMESSAGE }
#Import ".\LPWPUQUERYBLOCKINGCALLBACK.ahk" { LPWPUQUERYBLOCKINGCALLBACK }
#Import ".\LPWPUQUERYSOCKETHANDLECONTEXT.ahk" { LPWPUQUERYSOCKETHANDLECONTEXT }
#Import ".\LPWPUQUEUEAPC.ahk" { LPWPUQUEUEAPC }
#Import ".\LPWPURESETEVENT.ahk" { LPWPURESETEVENT }
#Import ".\LPWPUSETEVENT.ahk" { LPWPUSETEVENT }

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
    lpWPUCloseEvent : LPWPUCLOSEEVENT

    /**
     * Type: **LPWPUCLOSESOCKETHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuclosesockethandle">WPUCloseSocketHandle</a> function.
     */
    lpWPUCloseSocketHandle : LPWPUCLOSESOCKETHANDLE

    /**
     * Type: **LPWPUCREATEEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpucreateevent">WPUCreateEvent</a> function.
     */
    lpWPUCreateEvent : LPWPUCREATEEVENT

    /**
     * Type: **LPWPUCREATESOCKETHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpucreatesockethandle">WPUCreateSocketHandle</a> function.
     */
    lpWPUCreateSocketHandle : LPWPUCREATESOCKETHANDLE

    /**
     * Type: **LPWPUFDISSET**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpufdisset">WPUFDIsSet</a> function.
     */
    lpWPUFDIsSet : LPWPUFDISSET

    /**
     * Type: **LPWPUGETPROVIDERPATH**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpugetproviderpath">WPUGetProviderPath</a> function.
     */
    lpWPUGetProviderPath : LPWPUGETPROVIDERPATH

    /**
     * Type: **LPWPUMODIFYIFSHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpumodifyifshandle">WPUModifyIFSHandle</a> function.
     */
    lpWPUModifyIFSHandle : LPWPUMODIFYIFSHANDLE

    /**
     * Type: **LPWPUPOSTMESSAGE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpupostmessage">WPUPostMessage</a> function.
     */
    lpWPUPostMessage : LPWPUPOSTMESSAGE

    /**
     * Type: **LPWPUQUERYBLOCKINGCALLBACK**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuqueryblockingcallback">WPUQueryBlockingCallback</a> function.
     */
    lpWPUQueryBlockingCallback : LPWPUQUERYBLOCKINGCALLBACK

    /**
     * Type: **LPWPUQUERYSOCKETHANDLECONTEXT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuquerysockethandlecontext">WPUQuerySocketHandleContext</a> function.
     */
    lpWPUQuerySocketHandleContext : LPWPUQUERYSOCKETHANDLECONTEXT

    /**
     * Type: **LPWPUQUEUEAPC**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a> function.
     */
    lpWPUQueueApc : LPWPUQUEUEAPC

    /**
     * Type: **LPWPURESETEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuresetevent">WPUResetEvent</a> function.
     */
    lpWPUResetEvent : LPWPURESETEVENT

    /**
     * Type: **LPWPUSETEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpusetevent">WPUSetEvent</a> function.
     */
    lpWPUSetEvent : LPWPUSETEVENT

    /**
     * Type: **LPWPUOPENCURRENTTHREAD**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuopencurrentthread">WPUOpenCurrentThread</a> function.
     */
    lpWPUOpenCurrentThread : LPWPUOPENCURRENTTHREAD

    /**
     * Type: **LPWPUCLOSETHREAD**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuclosethread">WPUCloseThread</a> function.
     */
    lpWPUCloseThread : LPWPUCLOSETHREAD

}
