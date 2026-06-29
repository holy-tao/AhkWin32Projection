#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Sets the maximum real-time input rate of video frames being fed to the encoder.
 * @remarks
 * This property allows the caller to specify the maximum real-time input rate of video frames being fed to the encoder. This gives the encoder an indication of the rate that it will need to process the incoming frames. This is useful for encoders that set themselves into a particular power state configuration based on the resolution and frame-rate of the source video.
 * 
 * The frame rate is expressed as a ratio. The upper 32 bits of the attribute value contain the numerator and the lower 32 bits contain the denominator. For example, if the frame rate is 30 frames per second (fps), the ratio is 30/1. If the frame rate is 29.97 fps, the ratio is 30,000/1001.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencmaxframerate
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncMaxFrameRate {
    #StructPack 1

}
