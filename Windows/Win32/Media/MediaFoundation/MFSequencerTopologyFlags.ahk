#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags for adding a topology to the sequencer source, or updating a topology already in the queue.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsequencertopologyflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFSequencerTopologyFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This topology is the last topology in the sequence.
     * @type {Integer (Int32)}
     */
    static SequencerTopologyFlags_Last => 1
}
