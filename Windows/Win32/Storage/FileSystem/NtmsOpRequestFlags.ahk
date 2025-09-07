#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsOpRequestFlags{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOAUTOPURGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOFAILEDPURGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOALERTS => 16

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOTRAYICON => 32
}
