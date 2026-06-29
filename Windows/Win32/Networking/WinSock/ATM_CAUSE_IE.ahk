#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_CAUSE_IE {
    #StructPack 1

    Location : Int8

    Cause : Int8

    DiagnosticsLength : Int8

    Diagnostics : Int8[4]

}
