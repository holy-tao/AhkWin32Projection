#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class SND_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SND_APPLICATION
     * @type {Integer (UInt32)}
     */
    static APPLICATION => 128

    /**
     * Native name: SND_ALIAS
     * @type {Integer (UInt32)}
     */
    static ALIAS => 65536

    /**
     * Native name: SND_ALIAS_ID
     * @type {Integer (UInt32)}
     */
    static ALIAS_ID => 1114112

    /**
     * Native name: SND_FILENAME
     * @type {Integer (UInt32)}
     */
    static FILENAME => 131072

    /**
     * Native name: SND_RESOURCE
     * @type {Integer (UInt32)}
     */
    static RESOURCE => 262148

    /**
     * Native name: SND_ASYNC
     * @type {Integer (UInt32)}
     */
    static ASYNC => 1

    /**
     * Native name: SND_NODEFAULT
     * @type {Integer (UInt32)}
     */
    static NODEFAULT => 2

    /**
     * Native name: SND_LOOP
     * @type {Integer (UInt32)}
     */
    static LOOP => 8

    /**
     * Native name: SND_MEMORY
     * @type {Integer (UInt32)}
     */
    static MEMORY => 4

    /**
     * Native name: SND_NOSTOP
     * @type {Integer (UInt32)}
     */
    static NOSTOP => 16

    /**
     * Native name: SND_NOWAIT
     * @type {Integer (UInt32)}
     */
    static NOWAIT => 8192

    /**
     * Native name: SND_PURGE
     * @type {Integer (UInt32)}
     */
    static PURGE => 64

    /**
     * Native name: SND_SENTRY
     * @type {Integer (UInt32)}
     */
    static SENTRY => 524288

    /**
     * Native name: SND_SYNC
     * @type {Integer (UInt32)}
     */
    static SYNC => 0

    /**
     * Native name: SND_SYSTEM
     * @type {Integer (UInt32)}
     */
    static SYSTEM => 2097152
}
