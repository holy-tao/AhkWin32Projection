#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_RESOLUTION_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_MEDIASOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_BYTESTREAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_CONTENT_DOES_NOT_HAVE_TO_MATCH_EXTENSION_OR_MIME_TYPE => 16

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_KEEP_BYTE_STREAM_ALIVE_ON_FAIL => 32

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_DISABLE_LOCAL_PLUGINS => 64

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_PLUGIN_CONTROL_POLICY_APPROVED_ONLY => 128

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_PLUGIN_CONTROL_POLICY_WEB_ONLY => 256

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_PLUGIN_CONTROL_POLICY_WEB_ONLY_EDGEMODE => 512

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_ENABLE_STORE_PLUGINS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_READ => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MF_RESOLUTION_WRITE => 131072
}
