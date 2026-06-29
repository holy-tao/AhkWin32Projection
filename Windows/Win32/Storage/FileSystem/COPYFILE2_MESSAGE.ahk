#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COPYFILE2_COPY_PHASE.ahk" { COPYFILE2_COPY_PHASE }
#Import ".\COPYFILE2_MESSAGE_TYPE.ahk" { COPYFILE2_MESSAGE_TYPE }

/**
 * Passed to the CopyFile2ProgressRoutine callback function with information about a pending copy operation.
 * @remarks
 * To compile an application that uses the 
 *     <b>COPYFILE2_MESSAGE</b> structure, define the 
 *     <b>_WIN32_WINNT</b> macro as 0x0601 or later. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-copyfile2_message
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct COPYFILE2_MESSAGE {
    #StructPack 8


    struct _Info {

        struct _ChunkStarted {
            dwStreamNumber : UInt32

            dwReserved : UInt32

            hSourceFile : HANDLE

            hDestinationFile : HANDLE

            uliChunkNumber : Int64

            uliChunkSize : Int64

            uliStreamSize : Int64

            uliTotalFileSize : Int64

        }

        struct _ChunkFinished {
            dwStreamNumber : UInt32

            dwFlags : UInt32

            hSourceFile : HANDLE

            hDestinationFile : HANDLE

            uliChunkNumber : Int64

            uliChunkSize : Int64

            uliStreamSize : Int64

            uliStreamBytesTransferred : Int64

            uliTotalFileSize : Int64

            uliTotalBytesTransferred : Int64

        }

        struct _StreamStarted {
            dwStreamNumber : UInt32

            dwReserved : UInt32

            hSourceFile : HANDLE

            hDestinationFile : HANDLE

            uliStreamSize : Int64

            uliTotalFileSize : Int64

        }

        struct _StreamFinished {
            dwStreamNumber : UInt32

            dwReserved : UInt32

            hSourceFile : HANDLE

            hDestinationFile : HANDLE

            uliStreamSize : Int64

            uliStreamBytesTransferred : Int64

            uliTotalFileSize : Int64

            uliTotalBytesTransferred : Int64

        }

        struct _PollContinue {
            dwReserved : UInt32

        }

        struct _Error {
            CopyPhase : COPYFILE2_COPY_PHASE

            dwStreamNumber : UInt32

            hrFailure : HRESULT

            dwReserved : UInt32

            uliChunkNumber : Int64

            uliStreamSize : Int64

            uliStreamBytesTransferred : Int64

            uliTotalFileSize : Int64

            uliTotalBytesTransferred : Int64

        }

        ChunkStarted : COPYFILE2_MESSAGE._Info._ChunkStarted

        static __New() {
            DefineProp(this.Prototype, 'ChunkFinished', { type: COPYFILE2_MESSAGE._Info._ChunkFinished, offset: 0 })
            DefineProp(this.Prototype, 'StreamStarted', { type: COPYFILE2_MESSAGE._Info._StreamStarted, offset: 0 })
            DefineProp(this.Prototype, 'StreamFinished', { type: COPYFILE2_MESSAGE._Info._StreamFinished, offset: 0 })
            DefineProp(this.Prototype, 'PollContinue', { type: COPYFILE2_MESSAGE._Info._PollContinue, offset: 0 })
            DefineProp(this.Prototype, 'Error', { type: COPYFILE2_MESSAGE._Info._Error, offset: 0 })
            this.DeleteProp("__New")
        }
    }

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
     */
    Type : COPYFILE2_MESSAGE_TYPE

    dwPadding : UInt32

    Info : COPYFILE2_MESSAGE._Info

}
