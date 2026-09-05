#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that indicate the status of the IMFSourceReader::ReadSample method.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/ne-mfreadwrite-mf_source_reader_flag
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_SOURCE_READER_FLAG extends Win32BitflagEnum {

    /**
     * An error occurred. If you receive this flag, do not make any further calls to <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> methods.
     * Native name: MF_SOURCE_READERF_ERROR
     * @type {Integer (Int32)}
     */
    static READERF_ERROR => 1

    /**
     * The source reader reached the end of the stream.
     * Native name: MF_SOURCE_READERF_ENDOFSTREAM
     * @type {Integer (Int32)}
     */
    static READERF_ENDOFSTREAM => 2

    /**
     * One or more new streams were created. Respond to this flag by doing at least one of the following:
     * 
     * <ul>
     * <li>Set the output types on the new streams.</li>
     * <li>Update the stream selection by selecting or deselecting streams.</li>
     * </ul>
     * Native name: MF_SOURCE_READERF_NEWSTREAM
     * @type {Integer (Int32)}
     */
    static READERF_NEWSTREAM => 4

    /**
     * The <i>native format</i> has changed for one or more streams. The native format is the format delivered by the media source before any decoders are inserted.
     * Native name: MF_SOURCE_READERF_NATIVEMEDIATYPECHANGED
     * @type {Integer (Int32)}
     */
    static READERF_NATIVEMEDIATYPECHANGED => 16

    /**
     * The current media has type changed for one or more streams. To get the current media type, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getcurrentmediatype">IMFSourceReader::GetCurrentMediaType</a> method.
     * Native name: MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED
     * @type {Integer (Int32)}
     */
    static READERF_CURRENTMEDIATYPECHANGED => 32

    /**
     * There is a gap in the stream. This flag corresponds to an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamtick">MEStreamTick</a> event from the media source.
     * Native name: MF_SOURCE_READERF_STREAMTICK
     * @type {Integer (Int32)}
     */
    static READERF_STREAMTICK => 256

    /**
     * All transforms inserted by the application have been removed for a particular stream. This could be due to a dynamic format change from a source or decoder that prevents custom transforms from being used because they cannot handle the new media type.
     * Native name: MF_SOURCE_READERF_ALLEFFECTSREMOVED
     * @type {Integer (Int32)}
     */
    static READERF_ALLEFFECTSREMOVED => 512
}
