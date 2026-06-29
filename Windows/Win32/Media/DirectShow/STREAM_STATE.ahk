#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This API is deprecated. New applications should not use it. Describes the state of the stream.
 * @remarks
 * Change the state by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-imultimediastream-setstate">IMultiMediaStream::SetState</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mmstream/ne-mmstream-stream_state
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct STREAM_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
