#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether MFSampleExtension\_ROIRectangle attribute set on the input sample will be honored or not.
 * @remarks
 * Default value is 0.
 * 
 * If an encoder MFT accepts a non-zero value, it is expected that the encoder will honor the [MFSampleExtension\_ROIRectangle](mfsampleextension-roirectangle.md) attribute set on the input sample.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoroienabled
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoROIEnabled extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
