#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a table of pointers to service provider upcall functions.
 * @remarks
 * 
 * The **WSPUPCALLTABLE** structure contains a table of pointers to service provider upcall functions that are passed to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2spi/ns-ws2spi-wspupcalltable
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSPUPCALLTABLE extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Type: **LPWPUCLOSEEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpucloseevent">WPUCloseEvent</a> function.
     * @type {Pointer<LPWPUCLOSEEVENT>}
     */
    lpWPUCloseEvent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **LPWPUCLOSESOCKETHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuclosesockethandle">WPUCloseSocketHandle</a> function.
     * @type {Pointer<LPWPUCLOSESOCKETHANDLE>}
     */
    lpWPUCloseSocketHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **LPWPUCREATEEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpucreateevent">WPUCreateEvent</a> function.
     * @type {Pointer<LPWPUCREATEEVENT>}
     */
    lpWPUCreateEvent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **LPWPUCREATESOCKETHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpucreatesockethandle">WPUCreateSocketHandle</a> function.
     * @type {Pointer<LPWPUCREATESOCKETHANDLE>}
     */
    lpWPUCreateSocketHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **LPWPUFDISSET**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpufdisset">WPUFDIsSet</a> function.
     * @type {Pointer<LPWPUFDISSET>}
     */
    lpWPUFDIsSet {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **LPWPUGETPROVIDERPATH**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpugetproviderpath">WPUGetProviderPath</a> function.
     * @type {Pointer<LPWPUGETPROVIDERPATH>}
     */
    lpWPUGetProviderPath {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: **LPWPUMODIFYIFSHANDLE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpumodifyifshandle">WPUModifyIFSHandle</a> function.
     * @type {Pointer<LPWPUMODIFYIFSHANDLE>}
     */
    lpWPUModifyIFSHandle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: **LPWPUPOSTMESSAGE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpupostmessage">WPUPostMessage</a> function.
     * @type {Pointer<LPWPUPOSTMESSAGE>}
     */
    lpWPUPostMessage {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: **LPWPUQUERYBLOCKINGCALLBACK**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuqueryblockingcallback">WPUQueryBlockingCallback</a> function.
     * @type {Pointer<LPWPUQUERYBLOCKINGCALLBACK>}
     */
    lpWPUQueryBlockingCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: **LPWPUQUERYSOCKETHANDLECONTEXT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuquerysockethandlecontext">WPUQuerySocketHandleContext</a> function.
     * @type {Pointer<LPWPUQUERYSOCKETHANDLECONTEXT>}
     */
    lpWPUQuerySocketHandleContext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: **LPWPUQUEUEAPC**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a> function.
     * @type {Pointer<LPWPUQUEUEAPC>}
     */
    lpWPUQueueApc {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: **LPWPURESETEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuresetevent">WPUResetEvent</a> function.
     * @type {Pointer<LPWPURESETEVENT>}
     */
    lpWPUResetEvent {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: **LPWPUSETEVENT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpusetevent">WPUSetEvent</a> function.
     * @type {Pointer<LPWPUSETEVENT>}
     */
    lpWPUSetEvent {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: **LPWPUOPENCURRENTTHREAD**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuopencurrentthread">WPUOpenCurrentThread</a> function.
     * @type {Pointer<LPWPUOPENCURRENTTHREAD>}
     */
    lpWPUOpenCurrentThread {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Type: **LPWPUCLOSETHREAD**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpuclosethread">WPUCloseThread</a> function.
     * @type {Pointer<LPWPUCLOSETHREAD>}
     */
    lpWPUCloseThread {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
