#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a deferred symbol load. (IMAGEHLP_DEFERRED_SYMBOL_LOAD64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_DEFERRED_SYMBOL_LOAD</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_DEFERRED_SYMBOL_LOAD</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_deferred_symbol_load64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_DEFERRED_SYMBOL_LOAD64 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_DEFERRED_SYMBOL_LOAD64)</c>.
     */
    SizeOfStruct : UInt32

    /**
     * The base virtual address where the image is loaded.
     */
    BaseOfImage : Int64

    /**
     * The computed checksum of the image. This value can be zero.
     */
    CheckSum : UInt32

    /**
     * The date and timestamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The timestamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     */
    TimeDateStamp : UInt32

    /**
     * The image name. The name may or may not contain a full path.
     */
    FileName : CHAR[260]

    /**
     * If this member is <b>TRUE</b>, the operation should be performed again. Otherwise, it should not.
     */
    Reparse : BOOLEAN

    /**
     * A handle to a file. This member is used with <b>CBA_DEFERRED_SYMBOL_LOAD_PARTIAL</b> and <b>IMAGEHLP_DEFERRED_SYMBOL_LOAD_FAILURE</b> callbacks.
     */
    hFile : HANDLE

    Flags : UInt32

}
