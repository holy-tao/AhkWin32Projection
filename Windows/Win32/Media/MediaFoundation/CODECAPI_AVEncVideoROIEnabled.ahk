#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether MFSampleExtension\_ROIRectangle attribute set on the input sample will be honored or not.
 * @remarks
 * Default value is 0.
 * 
 * If an encoder MFT accepts a non-zero value, it is expected that the encoder will honor the [MFSampleExtension\_ROIRectangle](mfsampleextension-roirectangle.md) attribute set on the input sample.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoroienabled
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoROIEnabled {
    #StructPack 1

}
