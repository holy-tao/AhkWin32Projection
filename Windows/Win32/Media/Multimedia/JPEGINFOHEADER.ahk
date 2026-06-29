#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct JPEGINFOHEADER {
    #StructPack 4

    JPEGSize : UInt32

    JPEGProcess : UInt32

    JPEGColorSpaceID : UInt32

    JPEGBitsPerSample : UInt32

    JPEGHSubSampling : UInt32

    JPEGVSubSampling : UInt32

}
