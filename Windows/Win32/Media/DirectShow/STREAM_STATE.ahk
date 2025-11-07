#Requires AutoHotkey v2.0.0 64-bit

/**
 * Note  This API is deprecated. New applications should not use it. Describes the state of the stream.
 * @remarks
 * 
 * Change the state by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-imultimediastream-setstate">IMultiMediaStream::SetState</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmstream/ne-mmstream-stream_state
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class STREAM_STATE{

    /**
     * Stop state.
     * @type {Integer (Int32)}
     */
    static STREAMSTATE_STOP => 0

    /**
     * Run state.
     * @type {Integer (Int32)}
     */
    static STREAMSTATE_RUN => 1
}
