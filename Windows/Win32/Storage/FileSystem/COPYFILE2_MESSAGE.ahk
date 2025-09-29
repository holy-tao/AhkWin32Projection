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

    class _ChunkStarted extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwStreamNumber {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hSourceFile {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hDestinationFile {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        uliChunkNumber {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        uliChunkSize {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamSize {
            get => NumGet(this, 40, "uint")
            set => NumPut("uint", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        uliTotalFileSize {
            get => NumGet(this, 48, "uint")
            set => NumPut("uint", value, this, 48)
        }
    
    }

    class _ChunkFinished extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwStreamNumber {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwFlags {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hSourceFile {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hDestinationFile {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        uliChunkNumber {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        uliChunkSize {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamSize {
            get => NumGet(this, 40, "uint")
            set => NumPut("uint", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamBytesTransferred {
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
        uliTotalBytesTransferred {
            get => NumGet(this, 64, "uint")
            set => NumPut("uint", value, this, 64)
        }
    
    }

    class _StreamStarted extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwStreamNumber {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hSourceFile {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hDestinationFile {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamSize {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        uliTotalFileSize {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
    }

    class _StreamFinished extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwStreamNumber {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hSourceFile {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hDestinationFile {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamSize {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamBytesTransferred {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        uliTotalFileSize {
            get => NumGet(this, 40, "uint")
            set => NumPut("uint", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        uliTotalBytesTransferred {
            get => NumGet(this, 48, "uint")
            set => NumPut("uint", value, this, 48)
        }
    
    }

    class _Error extends Win32Struct {
        static sizeof => 4
        static packingSize => 8

        /**
         * @type {Integer}
         */
        CopyPhase {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwStreamNumber {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {HRESULT}
         */
        hrFailure {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        uliChunkNumber {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamSize {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        uliStreamBytesTransferred {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        uliTotalFileSize {
            get => NumGet(this, 40, "uint")
            set => NumPut("uint", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        uliTotalBytesTransferred {
            get => NumGet(this, 48, "uint")
            set => NumPut("uint", value, this, 48)
        }
    
    }

    /**
     * @type {_ChunkStarted}
     */
    ChunkStarted{
        get {
            if(!this.HasProp("__ChunkStarted"))
                this.__ChunkStarted := %this.__Class%._ChunkStarted(this.ptr + 8)
            return this.__ChunkStarted
        }
    }

    /**
     * @type {_ChunkFinished}
     */
    ChunkFinished{
        get {
            if(!this.HasProp("__ChunkFinished"))
                this.__ChunkFinished := %this.__Class%._ChunkFinished(this.ptr + 8)
            return this.__ChunkFinished
        }
    }

    /**
     * @type {_StreamStarted}
     */
    StreamStarted{
        get {
            if(!this.HasProp("__StreamStarted"))
                this.__StreamStarted := %this.__Class%._StreamStarted(this.ptr + 8)
            return this.__StreamStarted
        }
    }

    /**
     * @type {_StreamFinished}
     */
    StreamFinished{
        get {
            if(!this.HasProp("__StreamFinished"))
                this.__StreamFinished := %this.__Class%._StreamFinished(this.ptr + 8)
            return this.__StreamFinished
        }
    }

    /**
     * @type {Integer}
     */
    PollContinue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_Error}
     */
    Error{
        get {
            if(!this.HasProp("__Error"))
                this.__Error := %this.__Class%._Error(this.ptr + 8)
            return this.__Error
        }
    }
}
