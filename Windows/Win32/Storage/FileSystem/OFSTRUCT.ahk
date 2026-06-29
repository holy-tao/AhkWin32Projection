#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a file that the OpenFile function opened or attempted to open.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ofstruct
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct OFSTRUCT {
    #StructPack 2

    /**
     * The size of the structure, in bytes.
     */
    cBytes : Int8

    /**
     * If this member is nonzero, the file is on a hard (fixed) disk. Otherwise, it is not.
     */
    fFixedDisk : Int8

    /**
     * The MS-DOS error code if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfile">OpenFile</a> function failed.
     */
    nErrCode : UInt16

    /**
     * Reserved; do not use.
     */
    Reserved1 : UInt16

    /**
     * Reserved; do not use.
     */
    Reserved2 : UInt16

    /**
     * The path and file name of the file.
     */
    szPathName : CHAR[128]

}
