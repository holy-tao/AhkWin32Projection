#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPAUDIOBUFFERINFO {
    #StructPack 4

    ulMsMinNotification : UInt32

    ulMsBufferSize : UInt32

    ulMsEventBias : UInt32

}
