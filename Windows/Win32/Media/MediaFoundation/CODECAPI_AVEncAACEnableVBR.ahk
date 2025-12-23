#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies whether variable bitrate (VBR) encoding is used for AAC encoding.
 * @remarks
 * The default value is **FALSE**. This indicates that the AAC encoder MFT will use constant bit rate encoding.  The encoded bit stream will have a certain bitrate independent of the input signal. 
 * 
 * If this value is set to **TRUE**, it indicates that the AAC encoder MFT will use variable bit rate encoding. The encoder adapts the bitrate of the encoded stream depending on the psychoacoustic requirements of the input signal.
 * 
 * Apps should set the CODECAPI_AVEncAACEnableVBR property on the encoder MFT before setting the input and output media types on the encoder MFT. This is because the VBR setting may affect which input and output media type combinations are supported by the encoder.
 * 
 * Setting the CODECAPI_AVEncAACEnableVBR property after setting the input or output media types, may result in an error if the input or output media types are not supported by the requested VBR setting.
 * When VBR encoding is enabled, the MF_MT_AVG_BITRATE attribute on the output media type specifies the average bit rate of the encoded output.
 * 
 * Note that while the variant type of the CODECAPI_AVEncAACEnableVBR property is VT_BOOL, [IMFAttributes](/windows/win32/api/mfobjects/nn-mfobjects-imfattributes) does not support Boolean attributes. Therefore, you should use [SetUINT32](/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint32) instead. The attribute value will be automatically converted to a VT_BOOL property value when it is transferred to the encoder MFT.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencaacenablevbr
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncAACEnableVBR extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
