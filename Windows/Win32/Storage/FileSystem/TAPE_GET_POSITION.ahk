#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TAPE_POSITION_TYPE.ahk" { TAPE_POSITION_TYPE }

/**
 * Describes the position of the tape.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_get_position
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_GET_POSITION {
    #StructPack 8

    Type : TAPE_POSITION_TYPE

    /**
     * Partition to position within. If this member is zero, the current partition is assumed.
     */
    Partition : UInt32

    /**
     * Block address.
     */
    Offset : Int64

}
