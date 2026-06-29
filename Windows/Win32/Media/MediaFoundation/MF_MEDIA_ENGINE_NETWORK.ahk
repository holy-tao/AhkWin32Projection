#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines network status codes for the Media Engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_network
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_NETWORK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The initial state.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_NETWORK_EMPTY => 0

    /**
     * The Media Engine has started the resource selection algorithm, and has selected a media resource, but is not using the network.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_NETWORK_IDLE => 1

    /**
     * The Media Engine is loading a media resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_NETWORK_LOADING => 2

    /**
     * The Media Engine has started the resource selection algorithm, but has not selected a media resource.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_NETWORK_NO_SOURCE => 3
}
