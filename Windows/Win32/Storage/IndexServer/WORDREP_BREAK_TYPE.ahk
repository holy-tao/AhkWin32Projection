#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the type of break that separates the current word from the previous word.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/ne-indexsrv-wordrep_break_type
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct WORDREP_BREAK_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A word break is placed between this word and the previous word that was placed in the <b>WordSink</b>. This break is the default used by the <a href="https://docs.microsoft.com/windows/desktop/search/iwordsink-putword">PutWord</a> method.
     * @type {Integer (Int32)}
     */
    static WORDREP_BREAK_EOW => 0

    /**
     * A sentence break is placed between this word and the previous word.
     * @type {Integer (Int32)}
     */
    static WORDREP_BREAK_EOS => 1

    /**
     * A paragraph break is placed between this word and the previous word.
     * @type {Integer (Int32)}
     */
    static WORDREP_BREAK_EOP => 2

    /**
     * A chapter break is placed between this word and the previous word.
     * @type {Integer (Int32)}
     */
    static WORDREP_BREAK_EOC => 3
}
