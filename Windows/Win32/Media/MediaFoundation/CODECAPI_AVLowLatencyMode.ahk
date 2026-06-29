#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enables low-latency mode in a codec.
 * @remarks
 * This property applies to both encoders and decoders.
 * 
 * Low-latency mode is useful for real-time communications or live capture, when latency should be minimized. However, low-latency mode might also reduce the decoding or encoding quality.
 * 
 * The encoder is expected to not add any sample delay due to frame reordering in encoding process, and one input sample shall produce one output sample. B slices/frames can be present as long as they do not introduce any frame re-ordering in the encoder.
 * 
 * > [!WARNING] 
 * > In the current implementation, the Media Foundation H.264 decoder uses the type **VT_UI4** for this property. All other implementations, including the H.264 encoder, use the type **VT_BOOL**.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avlowlatencymode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVLowLatencyMode {
    #StructPack 1

}
