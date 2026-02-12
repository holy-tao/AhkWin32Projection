#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason why the app decided to disconnect the Miracast connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverdisconnectreason
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverDisconnectReason extends Win32Enum{

    /**
     * The stream ended without error.
     * @type {Integer (Int32)}
     */
    static Finished => 0

    /**
     * An error occurred in the app.
     * @type {Integer (Int32)}
     */
    static AppSpecificError => 1

    /**
     * The user refused the Miracast connection.
     * @type {Integer (Int32)}
     */
    static ConnectionNotAccepted => 2

    /**
     * The user requested to stop streaming.
     * @type {Integer (Int32)}
     */
    static DisconnectedByUser => 3

    /**
     * The app was unable to start streaming, for example, a connection error.
     * @type {Integer (Int32)}
     */
    static FailedToStartStreaming => 4

    /**
     * Streaming failed due to an error in decoding the audio or video data.
     * @type {Integer (Int32)}
     */
    static MediaDecodingError => 5

    /**
     * The app encountered an error while streaming was in progress. The error was not related to decoding or decrypting of the data.
     * @type {Integer (Int32)}
     */
    static MediaStreamingError => 6

    /**
     * Streaming failed due to an error related to decrypting of the audio or video data.
     * @type {Integer (Int32)}
     */
    static MediaDecryptionError => 7
}
