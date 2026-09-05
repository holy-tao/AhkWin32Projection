#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSINTERFACE_MEDIA extends Win32Enum {

    /**
     * Native name: KSINTERFACE_MEDIA_MUSIC
     * @type {Integer (Int32)}
     */
    static MUSIC => 0

    /**
     * Native name: KSINTERFACE_MEDIA_WAVE_BUFFERED
     * @type {Integer (Int32)}
     */
    static WAVE_BUFFERED => 1

    /**
     * Native name: KSINTERFACE_MEDIA_WAVE_QUEUED
     * @type {Integer (Int32)}
     */
    static WAVE_QUEUED => 2
}
