#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the compression modes that are used to save the InkDisp object to a serialized format.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkpersistencecompressionmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkPersistenceCompressionMode{

    /**
     * The default. Provides the best tradeoff between save-time and storage for the typical application.
     * @type {Integer (Int32)}
     */
    static IPCM_Default => 0

    /**
     * Maximum compression. This is the default value.
     * @type {Integer (Int32)}
     */
    static IPCM_MaximumCompression => 1

    /**
     * No compression. Used when save-time is more important than the amount of storage space used and when compatibility between versions is important.
     * @type {Integer (Int32)}
     */
    static IPCM_NoCompression => 2
}
