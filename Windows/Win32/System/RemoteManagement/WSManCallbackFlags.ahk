#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a set of flags used by all callback functions.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ne-wsman-wsmancallbackflags
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManCallbackFlags extends Win32Enum{

    /**
     * Indicates the end of a single step of a multi-step operation. This flag is used for optimization purposes if the shell cannot be determined.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_END_OF_OPERATION => 1

    /**
     * Indicates the end of a particular stream. This flag is used for optimization purposes if an indication has been provided to the shell that no more output will occur for this stream.
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_END_OF_STREAM => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_SHELL_SUPPORTS_DISCONNECT => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_SHELL_AUTODISCONNECTED => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_NETWORK_FAILURE_DETECTED => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_RETRYING_AFTER_NETWORK_FAILURE => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_RECONNECTED_AFTER_NETWORK_FAILURE => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_SHELL_AUTODISCONNECTING => 2048

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_RETRY_ABORTED_DUE_TO_INTERNAL_ERROR => 4096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WSMAN_FLAG_CALLBACK_RECEIVE_DELAY_STREAM_REQUEST_PROCESSED => 8192
}
