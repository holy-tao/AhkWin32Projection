#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SND_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SND_APPLICATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SND_ALIAS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SND_ALIAS_ID => 1114112

    /**
     * @type {Integer (UInt32)}
     */
    static SND_FILENAME => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SND_RESOURCE => 262148

    /**
     * @type {Integer (UInt32)}
     */
    static SND_ASYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SND_NODEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SND_LOOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SND_MEMORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SND_NOSTOP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SND_NOWAIT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SND_PURGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SND_SENTRY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SND_SYNC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SND_SYSTEM => 2097152
}
