#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTSINFOEX_LEVEL_A.ahk" { WTSINFOEX_LEVEL_A }
#Import ".\WTS_CONNECTSTATE_CLASS.ahk" { WTS_CONNECTSTATE_CLASS }
#Import ".\WTSINFOEX_LEVEL1_A.ahk" { WTSINFOEX_LEVEL1_A }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains a WTSINFOEX_LEVEL union that contains extended information about a Remote Desktop Services session. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoexa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTSINFOEXA {
    #StructPack 8

    /**
     * Specifies the level  of information contained in the <b>Data</b> member. This can be the following value.
     */
    Level : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoex_level_a">WTSINFOEX_LEVEL</a> union. The type of structure contained here is specified by the <b>Level</b> member.
     */
    Data : WTSINFOEX_LEVEL_A

}
