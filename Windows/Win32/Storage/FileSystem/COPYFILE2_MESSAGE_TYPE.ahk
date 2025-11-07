#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of message passed in the COPYFILE2_MESSAGE structure to the CopyFile2ProgressRoutine callback function.
 * @remarks
 * 
 * To compile an application that uses this enumeration, define the <b>_WIN32_WINNT</b> 
 *     macro as 0x0601 or later. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ne-winbase-copyfile2_message_type
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class COPYFILE2_MESSAGE_TYPE{

    /**
     * Not a valid value.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_NONE => 0

    /**
     * Indicates a single chunk of a stream has started to be copied.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_CHUNK_STARTED => 1

    /**
     * Indicates the copy of a single chunk of a stream has completed.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_CHUNK_FINISHED => 2

    /**
     * Indicates both source and destination handles for a stream have been opened and the  copy of the stream is 
 *       about to be started.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_STREAM_STARTED => 3

    /**
     * Indicates the copy operation for a stream have started to be completed.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_STREAM_FINISHED => 4

    /**
     * May be sent periodically.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_POLL_CONTINUE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_ERROR => 6

    /**
     * An error was encountered during the copy operation.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_CALLBACK_MAX => 7
}
