#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_ADAPTER_FLAG4 extends Win32BitflagEnum {

    /**
     * Native name: DXGI_ADAPTER_FLAG4_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DXGI_ADAPTER_FLAG4_REMOTE
     * @type {Integer (Int32)}
     */
    static REMOTE => 1

    /**
     * Native name: DXGI_ADAPTER_FLAG4_SOFTWARE
     * @type {Integer (Int32)}
     */
    static SOFTWARE => 2

    /**
     * Native name: DXGI_ADAPTER_FLAG4_ACG_COMPATIBLE
     * @type {Integer (Int32)}
     */
    static ACG_COMPATIBLE => 4

    /**
     * Native name: DXGI_ADAPTER_FLAG4_SUPPORT_MONITORED_FENCES
     * @type {Integer (Int32)}
     */
    static SUPPORT_MONITORED_FENCES => 8

    /**
     * Native name: DXGI_ADAPTER_FLAG4_SUPPORT_NON_MONITORED_FENCES
     * @type {Integer (Int32)}
     */
    static SUPPORT_NON_MONITORED_FENCES => 16

    /**
     * Native name: DXGI_ADAPTER_FLAG4_KEYED_MUTEX_CONFORMANCE
     * @type {Integer (Int32)}
     */
    static KEYED_MUTEX_CONFORMANCE => 32

    /**
     * Native name: DXGI_ADAPTER_FLAG4_SUPPORT_SINGLE_ADAPTER_HYBRID_MODE
     * @type {Integer (Int32)}
     */
    static SUPPORT_SINGLE_ADAPTER_HYBRID_MODE => 64
}
