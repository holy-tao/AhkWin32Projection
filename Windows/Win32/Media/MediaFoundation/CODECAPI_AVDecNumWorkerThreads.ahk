#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Sets the number of worker threads that are used by a video decoder.
 * @remarks
 * If the value is  1, the decoder selects the number of threads.
 * 
 * For the [**ICodecAPI**](/windows/desktop/api/strmif/nn-strmif-icodecapi) interface, set this property as a **LONG** value (**VT\_I4**). For the [**IMFAttributes**](/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes) interface, set this property as a **UINT32**, although the value is signed.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecnumworkerthreads
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVDecNumWorkerThreads {
    #StructPack 1

}
