#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of picture that is output by a video encoder.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-videoencodepicturetype">MFSampleExtension_VideoEncodePictureType</a> sample attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavench264picturetype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncH264PictureType extends Win32Enum{

    /**
     * Instantaneous decoding refresh (IDR) picture.
     * @type {Integer (Int32)}
     */
    static eAVEncH264PictureType_IDR => 0

    /**
     * Predictive (B) picture.
     * @type {Integer (Int32)}
     */
    static eAVEncH264PictureType_P => 1

    /**
     * Bi-predictive (B) picture.
     * @type {Integer (Int32)}
     */
    static eAVEncH264PictureType_B => 2
}
