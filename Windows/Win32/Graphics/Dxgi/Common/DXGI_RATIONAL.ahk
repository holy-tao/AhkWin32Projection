#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a rational number.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structure.
 * 
 * The <b>DXGI_RATIONAL</b> structure operates under the following rules:
 * 
 * <ul>
 * <li>0/0 is legal and will be interpreted as 0/1.</li>
 * <li>0/anything is interpreted as zero.</li>
 * <li>If you are representing a whole number, the denominator should be 1.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_rational
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_RATIONAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer value representing the top of the rational number.
     * @type {Integer}
     */
    Numerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer value representing the bottom of the rational number.
     * @type {Integer}
     */
    Denominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
