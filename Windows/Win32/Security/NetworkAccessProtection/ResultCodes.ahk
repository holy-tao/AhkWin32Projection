#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a list of result codes.
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-resultcodes
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class ResultCodes extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of result codes as a number between 0 and <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxDwordCountPerSoHAttribute</a>.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A pointer to either a list of application defined 4-octet HRESULTs that specify whether the client machine is compliant, or a list of <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-error-constants">NAP error constants</a> that specify the cause of <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoH</a> construction or processing errors. The values must be in the byte ordering of the host system.
     * @type {Pointer<HRESULT>}
     */
    results {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
