#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a debugging event.
 * @remarks
 * 
  * > [!NOTE]
  * > The dbghelp.h header defines IMAGEHLP_CBA_EVENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-imagehlp_cba_eventw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class IMAGEHLP_CBA_EVENTW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    severity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved for future use.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A text description of the error.
     * @type {PWSTR}
     */
    desc{
        get {
            if(!this.HasProp("__desc"))
                this.__desc := PWSTR(this.ptr + 8)
            return this.__desc
        }
    }

    /**
     * This member is reserved for future use.
     * @type {Pointer<Void>}
     */
    object {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
