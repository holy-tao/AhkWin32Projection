#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies tasks that Knowledge Consistency Checker (KCC) can execute.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_kcc_taskid
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_KCC_TASKID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Dynamically adjusts the data replication topology of a network.
     * @type {Integer (Int32)}
     */
    static DS_KCC_TASKID_UPDATE_TOPOLOGY => 0
}
