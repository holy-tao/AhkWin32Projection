#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoMeanAbsoluteDifference extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
