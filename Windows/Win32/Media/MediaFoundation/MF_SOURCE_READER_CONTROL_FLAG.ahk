#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags for the IMFSourceReader::ReadSample method.
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/ne-mfreadwrite-mf_source_reader_control_flag
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_SOURCE_READER_CONTROL_FLAG{

    /**
     * Retrieve any pending samples, but do not request any more samples from the media source. To get all of the pending samples, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">ReadSample</a> with this flag until the method returns a <b>NULL</b> media sample pointer.
     * @type {Integer (Int32)}
     */
    static MF_SOURCE_READER_CONTROLF_DRAIN => 1
}
