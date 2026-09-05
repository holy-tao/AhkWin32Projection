#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of break that separates the current word from the previous word.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/ne-indexsrv-wordrep_break_type
 * @namespace Windows.Win32.Storage.IndexServer
 */
class WORDREP_BREAK_TYPE extends Win32Enum {

    /**
     * A word break is placed between this word and the previous word that was placed in the <b>WordSink</b>. This break is the default used by the <a href="https://docs.microsoft.com/windows/desktop/search/iwordsink-putword">PutWord</a> method.
     * Native name: WORDREP_BREAK_EOW
     * @type {Integer (Int32)}
     */
    static EOW => 0

    /**
     * A sentence break is placed between this word and the previous word.
     * Native name: WORDREP_BREAK_EOS
     * @type {Integer (Int32)}
     */
    static EOS => 1

    /**
     * A paragraph break is placed between this word and the previous word.
     * Native name: WORDREP_BREAK_EOP
     * @type {Integer (Int32)}
     */
    static EOP => 2

    /**
     * A chapter break is placed between this word and the previous word.
     * Native name: WORDREP_BREAK_EOC
     * @type {Integer (Int32)}
     */
    static EOC => 3
}
