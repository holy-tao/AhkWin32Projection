#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a registry value. The RegQueryMultipleValues function uses this structure. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The winreg.h header defines VALENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winreg/ns-winreg-valentw
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 * @charset Unicode
 */
class VALENTW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The name of the value to be retrieved. Be sure to set this member before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a>.
     * @type {PWSTR}
     */
    ve_valuename{
        get {
            if(!this.HasProp("__ve_valuename"))
                this.__ve_valuename := PWSTR(this.ptr + 0)
            return this.__ve_valuename
        }
    }

    /**
     * The size of the data pointed to by <b>ve_valueptr</b>, in bytes.
     * @type {Integer}
     */
    ve_valuelen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to the data for the value entry. This is a pointer to the value's data returned in the <b>lpValueBuf</b> buffer filled in by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a>.
     * @type {Pointer}
     */
    ve_valueptr {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The type of data pointed to by <b>ve_valueptr</b>. For a list of the possible types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     * @type {Integer}
     */
    ve_type {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
