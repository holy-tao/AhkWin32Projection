#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets the number of worker threads that are used by a video decoder.
 * @remarks
 * If the value is  1, the decoder selects the number of threads.
 * 
 * For the [**ICodecAPI**](/windows/desktop/api/strmif/nn-strmif-icodecapi) interface, set this property as a **LONG** value (**VT\_I4**). For the [**IMFAttributes**](/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes) interface, set this property as a **UINT32**, although the value is signed.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecnumworkerthreads
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVDecNumWorkerThreads extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
