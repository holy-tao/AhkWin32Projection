#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of picture that is output by a video encoder.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-videoencodepicturetype">MFSampleExtension_VideoEncodePictureType</a> sample attribute.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavench264picturetype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncH264PictureType extends Win32Enum {

    /**
     * Instantaneous decoding refresh (IDR) picture.
     * Native name: eAVEncH264PictureType_IDR
     * @type {Integer (Int32)}
     */
    static IDR => 0

    /**
     * Predictive (B) picture.
     * Native name: eAVEncH264PictureType_P
     * @type {Integer (Int32)}
     */
    static P => 1

    /**
     * Bi-predictive (B) picture.
     * Native name: eAVEncH264PictureType_B
     * @type {Integer (Int32)}
     */
    static B => 2
}
