#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FILEDESCRIPTORW.ahk

/**
 * Defines the CF_FILEGROUPDESCRIPTOR clipboard format. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The shlobj_core.h header defines FILEGROUPDESCRIPTOR as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filegroupdescriptorw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class FILEGROUPDESCRIPTORW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The number of elements in <b>fgd</b>.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-filedescriptora">FILEDESCRIPTOR</a>[1]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-filedescriptora">FILEDESCRIPTOR</a> structures that contain the file information.
     * @type {Array<FILEDESCRIPTORW>}
     */
    fgd{
        get {
            if(!this.HasProp("__fgdProxyArray"))
                this.__fgdProxyArray := Win32FixedArray(this.ptr + 8, 1, FILEDESCRIPTORW, "")
            return this.__fgdProxyArray
        }
    }
}
