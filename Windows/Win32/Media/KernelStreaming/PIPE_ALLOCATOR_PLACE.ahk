#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct PIPE_ALLOCATOR_PLACE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static Pipe_Allocator_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Pipe_Allocator_FirstPin => 1

    /**
     * @type {Integer (Int32)}
     */
    static Pipe_Allocator_LastPin => 2

    /**
     * @type {Integer (Int32)}
     */
    static Pipe_Allocator_MiddlePin => 3
}
