#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains module information. (IMAGEHLP_MODULE)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_MODULE</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_MODULE</b> is defined as follows in DbgHelp.h. 
  * 
  * 
  * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_module
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class IMAGEHLP_MODULE extends Win32Struct
{
    static sizeof => 572

    static packingSize => 4

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_MODULE64)</c>.
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
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the image, in bytes.
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The date and timestamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The timestamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The checksum of the image. This value can be zero.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of symbols in the symbol table.  The value of this parameter is not meaningful when <b>SymPdb</b> is specified as  the value of the <i>SymType</i> parameter.
     * @type {Integer}
     */
    NumSyms {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    SymType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The module name.
     * @type {String}
     */
    ModuleName {
        get => StrGet(this.ptr + 28, 31, "UTF-8")
        set => StrPut(value, this.ptr + 28, 31, "UTF-8")
    }

    /**
     * The image name. The name may or may not contain a full path.
     * @type {String}
     */
    ImageName {
        get => StrGet(this.ptr + 60, 255, "UTF-8")
        set => StrPut(value, this.ptr + 60, 255, "UTF-8")
    }

    /**
     * The full path and file name of the file from which symbols were loaded.
     * @type {String}
     */
    LoadedImageName {
        get => StrGet(this.ptr + 316, 255, "UTF-8")
        set => StrPut(value, this.ptr + 316, 255, "UTF-8")
    }
}
