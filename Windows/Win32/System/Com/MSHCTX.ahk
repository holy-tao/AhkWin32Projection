#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the destination context, which is the process in which the unmarshaling is to be done.
 * @see https://learn.microsoft.com/windows/win32/api/wtypesbase/ne-wtypesbase-mshctx
 * @namespace Windows.Win32.System.Com
 */
class MSHCTX extends Win32Enum {

    /**
     * The unmarshaling process is local and has shared memory access with the marshaling process.
     * Native name: MSHCTX_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 0

    /**
     * The unmarshaling process does not have shared memory access with the marshaling process.
     * Native name: MSHCTX_NOSHAREDMEM
     * @type {Integer (Int32)}
     */
    static NOSHAREDMEM => 1

    /**
     * The unmarshaling process is on a different computer. The marshaling code cannot assume that a particular piece of application code is installed on that computer.
     * Native name: MSHCTX_DIFFERENTMACHINE
     * @type {Integer (Int32)}
     */
    static DIFFERENTMACHINE => 2

    /**
     * The unmarshaling will be done in another apartment in the same process.
     * Native name: MSHCTX_INPROC
     * @type {Integer (Int32)}
     */
    static INPROC => 3

    /**
     * Create a new context in the current apartment.
     * Native name: MSHCTX_CROSSCTX
     * @type {Integer (Int32)}
     */
    static CROSSCTX => 4

    /**
     * Native name: MSHCTX_CONTAINER
     * @type {Integer (Int32)}
     */
    static CONTAINER => 5
}
