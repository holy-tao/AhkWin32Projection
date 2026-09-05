#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class FlushIntention extends Win32Enum {

    /**
     * Native name: FlushIntentionFlush
     * @type {Integer (Int32)}
     */
    static Flush => 0

    /**
     * Native name: FlushIntentionSync
     * @type {Integer (Int32)}
     */
    static Sync => 1
}
