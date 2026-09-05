#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_RESOLUTION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: MF_RESOLUTION_MEDIASOURCE
     * @type {Integer (Int32)}
     */
    static MEDIASOURCE => 1

    /**
     * Native name: MF_RESOLUTION_BYTESTREAM
     * @type {Integer (Int32)}
     */
    static BYTESTREAM => 2

    /**
     * Native name: MF_RESOLUTION_CONTENT_DOES_NOT_HAVE_TO_MATCH_EXTENSION_OR_MIME_TYPE
     * @type {Integer (Int32)}
     */
    static CONTENT_DOES_NOT_HAVE_TO_MATCH_EXTENSION_OR_MIME_TYPE => 16

    /**
     * Native name: MF_RESOLUTION_KEEP_BYTE_STREAM_ALIVE_ON_FAIL
     * @type {Integer (Int32)}
     */
    static KEEP_BYTE_STREAM_ALIVE_ON_FAIL => 32

    /**
     * Native name: MF_RESOLUTION_DISABLE_LOCAL_PLUGINS
     * @type {Integer (Int32)}
     */
    static DISABLE_LOCAL_PLUGINS => 64

    /**
     * Native name: MF_RESOLUTION_PLUGIN_CONTROL_POLICY_APPROVED_ONLY
     * @type {Integer (Int32)}
     */
    static PLUGIN_CONTROL_POLICY_APPROVED_ONLY => 128

    /**
     * Native name: MF_RESOLUTION_PLUGIN_CONTROL_POLICY_WEB_ONLY
     * @type {Integer (Int32)}
     */
    static PLUGIN_CONTROL_POLICY_WEB_ONLY => 256

    /**
     * Native name: MF_RESOLUTION_PLUGIN_CONTROL_POLICY_WEB_ONLY_EDGEMODE
     * @type {Integer (Int32)}
     */
    static PLUGIN_CONTROL_POLICY_WEB_ONLY_EDGEMODE => 512

    /**
     * Native name: MF_RESOLUTION_ENABLE_STORE_PLUGINS
     * @type {Integer (Int32)}
     */
    static ENABLE_STORE_PLUGINS => 1024

    /**
     * Native name: MF_RESOLUTION_READ
     * @type {Integer (Int32)}
     */
    static READ => 65536

    /**
     * Native name: MF_RESOLUTION_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 131072
}
