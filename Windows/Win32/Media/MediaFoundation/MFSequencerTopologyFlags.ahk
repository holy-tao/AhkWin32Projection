#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags for adding a topology to the sequencer source, or updating a topology already in the queue.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfsequencertopologyflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSequencerTopologyFlags{

    /**
     * This topology is the last topology in the sequence.
     * @type {Integer (Int32)}
     */
    static SequencerTopologyFlags_Last => 1
}
