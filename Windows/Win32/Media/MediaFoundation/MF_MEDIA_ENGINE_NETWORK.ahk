#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines network status codes for the Media Engine.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_network
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_NETWORK extends Win32Enum{

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
