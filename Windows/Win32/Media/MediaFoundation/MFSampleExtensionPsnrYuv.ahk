#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFSampleExtensionPsnrYuv {
    #StructPack 4

    psnrY : Float32

    psnrU : Float32

    psnrV : Float32

}
