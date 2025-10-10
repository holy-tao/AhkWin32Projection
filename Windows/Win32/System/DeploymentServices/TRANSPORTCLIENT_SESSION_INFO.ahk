#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used by the PFN_WdsTransportClientSessionStartEx callback function.
 * @see https://docs.microsoft.com/windows/win32/api//wdstci/ns-wdstci-transportclient_session_info
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class TRANSPORTCLIENT_SESSION_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The length of this structure in bytes.
     * @type {Integer}
     */
    ulStructureLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the file, in bytes.
     * @type {Integer}
     */
    ullFileSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of a receive block, in bytes.
     * @type {Integer}
     */
    ulBlockSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
