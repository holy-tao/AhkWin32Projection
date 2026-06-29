#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\TAPEMARK_TYPE.ahk" { TAPEMARK_TYPE }

/**
 * Describes the type and number of tapemarks to write.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_write_marks
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_WRITE_MARKS {
    #StructPack 4

    Type : TAPEMARK_TYPE

    /**
     * Number of tapemarks to write.
     */
    Count : UInt32

    /**
     * If this member is <b>TRUE</b>, return as soon as the operation begins. Otherwise, return after the operation has completed.
     */
    Immediate : BOOLEAN

}
