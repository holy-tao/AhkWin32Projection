#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoD3D12ReconstructedPictureOutputMode extends Win32Enum {

    /**
     * Native name: eAVEncVideoEncodeD3D12ReconstructedPictureMode_None
     * @type {Integer (Int32)}
     */
    static EncodeD3D12ReconstructedPictureMode_None => 0

    /**
     * Native name: eAVEncVideoEncodeD3D12ReconstructedPictureMode_Copy
     * @type {Integer (Int32)}
     */
    static EncodeD3D12ReconstructedPictureMode_Copy => 1

    /**
     * Native name: eAVEncVideoEncodeD3D12ReconstructedPictureMode_Shared
     * @type {Integer (Int32)}
     */
    static EncodeD3D12ReconstructedPictureMode_Shared => 2
}
