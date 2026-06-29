#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TAPE_POSITION_METHOD.ahk" { TAPE_POSITION_METHOD }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Describes how and where to position the tape.
 * @remarks
 * If the positioning is relative, a positive offset moves the tape forward (toward the end of the tape) and a negative offset moves the tape backward (toward the beginning of the tape).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_set_position
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_SET_POSITION {
    #StructPack 8

    Method : TAPE_POSITION_METHOD

    /**
     * Partition to position within. If this member is zero, the current partition is assumed.
     */
    Partition : UInt32

    /**
     * Block address or count for the position operation specified by the <b>Method</b> member.
     */
    Offset : Int64

    /**
     * If this member is <b>TRUE</b>, return as soon as the operation begins. Otherwise, return after the operation has completed.
     */
    Immediate : BOOLEAN

}
