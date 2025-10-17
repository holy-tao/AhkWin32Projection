#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTSINFOEX_LEVEL1_A.ahk
#Include .\WTSINFOEX_LEVEL_A.ahk

/**
 * Contains a WTSINFOEX_LEVEL union that contains extended information about a Remote Desktop Services session.
 * @remarks
 * 
  * > [!NOTE]
  * > The wtsapi32.h header defines WTSINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ns-wtsapi32-wtsinfoexa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTSINFOEXA extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Specifies the level  of information contained in the <b>Data</b> member. This can be the following value.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoex_level_a">WTSINFOEX_LEVEL</a> union. The type of structure contained here is specified by the <b>Level</b> member.
     * @type {WTSINFOEX_LEVEL_A}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := WTSINFOEX_LEVEL_A(8, this)
            return this.__Data
        }
    }
}
