#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines network status codes for the Media Engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_network
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_NETWORK extends Win32Enum {

    /**
     * The initial state.
     * Native name: MF_MEDIA_ENGINE_NETWORK_EMPTY
     * @type {Integer (Int32)}
     */
    static EMPTY => 0

    /**
     * The Media Engine has started the resource selection algorithm, and has selected a media resource, but is not using the network.
     * Native name: MF_MEDIA_ENGINE_NETWORK_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 1

    /**
     * The Media Engine is loading a media resource.
     * Native name: MF_MEDIA_ENGINE_NETWORK_LOADING
     * @type {Integer (Int32)}
     */
    static LOADING => 2

    /**
     * The Media Engine has started the resource selection algorithm, but has not selected a media resource.
     * Native name: MF_MEDIA_ENGINE_NETWORK_NO_SOURCE
     * @type {Integer (Int32)}
     */
    static NO_SOURCE => 3
}
