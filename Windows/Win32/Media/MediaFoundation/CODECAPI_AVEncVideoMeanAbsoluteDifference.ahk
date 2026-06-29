#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Controls the signaling of MFSampleExtension\_MeanAbsoluteDifference through IMFAttribute on each output sample.
 * @remarks
 * If the application sets a non-zero value then the encoder should add the [MFSampleExtension\_MeanAbsoluteDifference](mfsampleextension-meanabsolutedifference.md) sample attribute to each output sample. The MFSampleExtension\_MeanAbsoluteDifference attribute indicates the mean absolute difference between the source samples and the predicted samples in the Y plane.
 * 
 * If the encoder returns 0 for **GetParameterRange**, then the encoder does not support the output of [MFSampleExtension\_MeanAbsoluteDifference](mfsampleextension-meanabsolutedifference.md) on the output samples.
 * 
 * The default value should be 0.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideomeanabsolutedifference
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoMeanAbsoluteDifference {
    #StructPack 1

}
