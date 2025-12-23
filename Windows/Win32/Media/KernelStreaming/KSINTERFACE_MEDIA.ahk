#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSINTERFACE_MEDIA extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSINTERFACE_MEDIA_MUSIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSINTERFACE_MEDIA_WAVE_BUFFERED => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSINTERFACE_MEDIA_WAVE_QUEUED => 2
}
