#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEERDIST_STATUS.ahk
#Include .\PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE.ahk

/**
 * The PEERDIST_STATUS_INFO structure contains information about the current status and capabilities of the BranchCache service on the local computer.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ns-peerdist-peerdist_status_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEERDIST_STATUS_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * Size, in bytes, of the <b>PEERDIST_STATUS_INFO</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the current status of the BranchCache service. This member should be one of following values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ne-peerdist-peerdist_status">PEERDIST_STATUS</a> enumeration.
     * @type {PEERDIST_STATUS}
     */
    status {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE}
     */
    dwMinVer {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE}
     */
    dwMaxVer {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
