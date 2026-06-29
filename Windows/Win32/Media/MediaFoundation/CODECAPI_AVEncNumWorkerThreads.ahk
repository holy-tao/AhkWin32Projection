#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Sets the number of worker threads used by a video encoder.
 * @remarks
 * If the value is zero, the encoder selects the number of threads.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencnumworkerthreads
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncNumWorkerThreads {
    #StructPack 1

}
