#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * Contains information about a deferred symbol load.
 * @remarks
 * 
  * This structure supersedes the <b>IMAGEHLP_DEFERRED_SYMBOL_LOAD</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_DEFERRED_SYMBOL_LOAD</b> is defined as follows in DbgHelp.h. 
  * 
  * 
  * ```cpp
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-imagehlp_deferred_symbol_load64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_DEFERRED_SYMBOL_LOAD64 extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_DEFERRED_SYMBOL_LOAD64)</c>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The base virtual address where the image is loaded.
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The computed checksum of the image. This value can be zero.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The date and timestamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The timestamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The image name. The name may or may not contain a full path.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }

    /**
     * If this member is <b>TRUE</b>, the operation should be performed again. Otherwise, it should not.
     * @type {BOOLEAN}
     */
    Reparse {
        get => NumGet(this, 544, "char")
        set => NumPut("char", value, this, 544)
    }

    /**
     * A handle to a file. This member is used with <b>CBA_DEFERRED_SYMBOL_LOAD_PARTIAL</b> and <b>IMAGEHLP_DEFERRED_SYMBOL_LOAD_FAILURE</b> callbacks.
     * @type {HANDLE}
     */
    hFile{
        get {
            if(!this.HasProp("__hFile"))
                this.__hFile := HANDLE(552, this)
            return this.__hFile
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }
}
