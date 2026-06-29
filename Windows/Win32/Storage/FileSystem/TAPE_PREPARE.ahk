#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PREPARE_TAPE_OPERATION.ahk" { PREPARE_TAPE_OPERATION }

/**
 * Describes how to prepare the tape.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_prepare
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_PREPARE {
    #StructPack 4

    Operation : PREPARE_TAPE_OPERATION

    Immediate : BOOLEAN

}
