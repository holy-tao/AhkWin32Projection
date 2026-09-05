#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the phase of a copy at the time of an error.
 * @remarks
 * To compile an application that uses this enumeration, define the <b>_WIN32_WINNT</b> 
 *     macro as 0x0601 or later. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-copyfile2_copy_phase
 * @namespace Windows.Win32.Storage.FileSystem
 */
class COPYFILE2_COPY_PHASE extends Win32Enum {

    /**
     * The copy had not yet started processing.
     * Native name: COPYFILE2_PHASE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The source was being prepared including opening a handle to the source. This phase happens once per stream 
     *       copy operation.
     * Native name: COPYFILE2_PHASE_PREPARE_SOURCE
     * @type {Integer (Int32)}
     */
    static PREPARE_SOURCE => 1

    /**
     * The destination was being prepared including opening a handle to the destination. This phase happens once 
     *       per stream copy operation.
     * Native name: COPYFILE2_PHASE_PREPARE_DEST
     * @type {Integer (Int32)}
     */
    static PREPARE_DEST => 2

    /**
     * The source file was being read. This phase happens one or more times per stream copy operation.
     * Native name: COPYFILE2_PHASE_READ_SOURCE
     * @type {Integer (Int32)}
     */
    static READ_SOURCE => 3

    /**
     * The destination file was being written. This phase happens one or more times per stream copy 
     *       operation.
     * Native name: COPYFILE2_PHASE_WRITE_DESTINATION
     * @type {Integer (Int32)}
     */
    static WRITE_DESTINATION => 4

    /**
     * Both the source and destination were on the same remote server and the copy was being processed remotely. 
     *       This phase happens once per stream copy operation.
     * Native name: COPYFILE2_PHASE_SERVER_COPY
     * @type {Integer (Int32)}
     */
    static SERVER_COPY => 5

    /**
     * The copy operation was processing symbolic links and/or reparse points. This phase happens once per file 
     *       copy operation.
     * Native name: COPYFILE2_PHASE_NAMEGRAFT_COPY
     * @type {Integer (Int32)}
     */
    static NAMEGRAFT_COPY => 6

    /**
     * One greater than the maximum value. Valid values for this enumeration will be less than this value.
     * Native name: COPYFILE2_PHASE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 7
}
