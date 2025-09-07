#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Passed to the CopyFile2ProgressRoutine callback function with information about a pending copy operation.
 * @remarks
 * To compile an application that uses the 
  *     <b>COPYFILE2_MESSAGE</b> structure, define the 
  *     <b>_WIN32_WINNT</b> macro as 0x0601 or later. For more information, see 
  *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-copyfile2_message
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class COPYFILE2_MESSAGE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Value from the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ne-winbase-copyfile2_message_type">COPYFILE2_MESSAGE_TYPE</a> 
     *       enumeration used as a discriminant for the <b>Info</b> union within this structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COPYFILE2_CALLBACK_CHUNK_STARTED"></a><a id="copyfile2_callback_chunk_started"></a><dl>
     * <dt><b>COPYFILE2_CALLBACK_CHUNK_STARTED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a single chunk of a stream has started to be copied. Information is in the 
     *         <b>ChunkStarted</b> structure within the <b>Info</b> 
     *         union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COPYFILE2_CALLBACK_CHUNK_FINISHED"></a><a id="copyfile2_callback_chunk_finished"></a><dl>
     * <dt><b>COPYFILE2_CALLBACK_CHUNK_FINISHED</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the copy of a single chunk of a stream has completed. Information is in the 
     *         <b>ChunkFinished</b> structure within the <b>Info</b> 
     *         union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COPYFILE2_CALLBACK_STREAM_STARTED"></a><a id="copyfile2_callback_stream_started"></a><dl>
     * <dt><b>COPYFILE2_CALLBACK_STREAM_STARTED</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates both source and destination handles for a stream have been opened and the  copy of the stream 
     *         is about to be started. Information is in the <b>StreamStarted</b> structure within 
     *         the <b>Info</b> union. This does not indicate that the copy has started for that stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COPYFILE2_CALLBACK_STREAM_FINISHED"></a><a id="copyfile2_callback_stream_finished"></a><dl>
     * <dt><b>COPYFILE2_CALLBACK_STREAM_FINISHED</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the copy operation for a stream have started to be completed, either successfully or due to a 
     *         <b>COPYFILE2_PROGRESS_STOP</b> return from 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-pcopyfile2_progress_routine">CopyFile2ProgressRoutine</a>.  Information is 
     *         in the <b>StreamFinished</b> structure within the <b>Info</b> 
     *         union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COPYFILE2_CALLBACK_POLL_CONTINUE"></a><a id="copyfile2_callback_poll_continue"></a><dl>
     * <dt><b>COPYFILE2_CALLBACK_POLL_CONTINUE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * May be sent periodically.  Information is in the 
     *         <b>PollContinue</b> structure within the <b>Info</b> 
     *         union.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COPYFILE2_CALLBACK_ERROR"></a><a id="copyfile2_callback_error"></a><dl>
     * <dt><b>COPYFILE2_CALLBACK_ERROR</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error was encountered during the copy operation.  Information is in the 
     *         <b>Error</b> structure within the <b>Info</b> 
     *         union.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwPadding {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwStreamNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hSourceFile {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hDestinationFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uliChunkNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uliChunkSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    uliStreamSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    uliTotalFileSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    uliStreamBytesTransferred {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    uliTotalFileSize1 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    uliTotalBytesTransferred {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    uliStreamSize1 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uliTotalFileSize12 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    uliStreamSize12 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uliStreamBytesTransferred1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    uliTotalFileSize123 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    uliTotalBytesTransferred1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    PollContinue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CopyPhase {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwStreamNumber1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    hrFailure {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    uliChunkNumber1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uliStreamSize123 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uliStreamBytesTransferred12 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    uliTotalFileSize1234 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    uliTotalBytesTransferred12 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
