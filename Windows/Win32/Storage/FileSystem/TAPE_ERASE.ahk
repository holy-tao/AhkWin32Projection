#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\ERASE_TAPE_TYPE.ahk" { ERASE_TAPE_TYPE }

/**
 * Describes the partition to be erased.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_erase
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_ERASE {
    #StructPack 4

    Type : ERASE_TAPE_TYPE

    /**
     * If this member is <b>TRUE</b>, return as soon as the erase operation begins. Otherwise, return when the operation has been completed.
     */
    Immediate : BOOLEAN

}
