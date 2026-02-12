#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the current status of a chat message such as draft, sent, or received.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestatus
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageStatus extends Win32Enum{

    /**
     * Draft
     * @type {Integer (Int32)}
     */
    static Draft => 0

    /**
     * Sending
     * @type {Integer (Int32)}
     */
    static Sending => 1

    /**
     * Sent
     * @type {Integer (Int32)}
     */
    static Sent => 2

    /**
     * Send retry needed
     * @type {Integer (Int32)}
     */
    static SendRetryNeeded => 3

    /**
     * Send failed
     * @type {Integer (Int32)}
     */
    static SendFailed => 4

    /**
     * Received
     * @type {Integer (Int32)}
     */
    static Received => 5

    /**
     * Received download needed
     * @type {Integer (Int32)}
     */
    static ReceiveDownloadNeeded => 6

    /**
     * Receive download failed
     * @type {Integer (Int32)}
     */
    static ReceiveDownloadFailed => 7

    /**
     * Receive downloading
     * @type {Integer (Int32)}
     */
    static ReceiveDownloading => 8

    /**
     * Deleted
     * @type {Integer (Int32)}
     */
    static Deleted => 9

    /**
     * Declined
     * @type {Integer (Int32)}
     */
    static Declined => 10

    /**
     * Cancelled
     * @type {Integer (Int32)}
     */
    static Cancelled => 11

    /**
     * Recalled
     * @type {Integer (Int32)}
     */
    static Recalled => 12

    /**
     * Receive retry needed
     * @type {Integer (Int32)}
     */
    static ReceiveRetryNeeded => 13
}
