#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Defines a list of result codes.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-resultcodes
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct ResultCodes {
    #StructPack 8

    /**
     * The number of result codes as a number between 0 and <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxDwordCountPerSoHAttribute</a>.
     */
    count : UInt16

    /**
     * A pointer to either a list of application defined 4-octet HRESULTs that specify whether the client machine is compliant, or a list of <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-error-constants">NAP error constants</a> that specify the cause of <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoH</a> construction or processing errors. The values must be in the byte ordering of the host system.
     */
    results : IntPtr

}
