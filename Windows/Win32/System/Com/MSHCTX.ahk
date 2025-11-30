#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the destination context, which is the process in which the unmarshaling is to be done.
 * @see https://docs.microsoft.com/windows/win32/api//wtypesbase/ne-wtypesbase-mshctx
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class MSHCTX extends Win32Enum{

    /**
     * The unmarshaling process is local and has shared memory access with the marshaling process.
     * @type {Integer (Int32)}
     */
    static MSHCTX_LOCAL => 0

    /**
     * The unmarshaling process does not have shared memory access with the marshaling process.
     * @type {Integer (Int32)}
     */
    static MSHCTX_NOSHAREDMEM => 1

    /**
     * The unmarshaling process is on a different computer. The marshaling code cannot assume that a particular piece of application code is installed on that computer.
     * @type {Integer (Int32)}
     */
    static MSHCTX_DIFFERENTMACHINE => 2

    /**
     * The unmarshaling will be done in another apartment in the same process.
     * @type {Integer (Int32)}
     */
    static MSHCTX_INPROC => 3

    /**
     * Create a new context in the current apartment.
     * @type {Integer (Int32)}
     */
    static MSHCTX_CROSSCTX => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSHCTX_CONTAINER => 5
}
