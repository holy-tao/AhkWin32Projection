#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags for the MF_TRANSCODE_TOPOLOGYMODE attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_transcode_topologymode_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TRANSCODE_TOPOLOGYMODE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The topology loader will exclude hardware-based transforms (such as codecs and color converters) from the topology. It will use only software transforms.
     * @type {Integer (Int32)}
     */
    static MF_TRANSCODE_TOPOLOGYMODE_SOFTWARE_ONLY => 0

    /**
     * The topology loader may insert hardware-based transforms into the transcode topology.
     * @type {Integer (Int32)}
     */
    static MF_TRANSCODE_TOPOLOGYMODE_HARDWARE_ALLOWED => 1
}
