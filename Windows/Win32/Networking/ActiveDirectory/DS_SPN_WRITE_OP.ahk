#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DS_SPN_WRITE_OP enumeration identifies the type of write operation that should be performed by the DsWriteAccountSpn function.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_spn_write_op
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_SPN_WRITE_OP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Adds the specified service principal names (SPNs) to the object identified by the <i>pszAccount</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dswriteaccountspna">DsWriteAccountSpn</a>.
     * @type {Integer (Int32)}
     */
    static DS_SPN_ADD_SPN_OP => 0

    /**
     * Removes all SPNs currently registered on the account identified by the <i>pszAccount</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dswriteaccountspna">DsWriteAccountSpn</a> and replaces them with the SPNs specified  by the <i>rpszSpn</i> parameter in <b>DsWriteAccountSpn</b>.
     * @type {Integer (Int32)}
     */
    static DS_SPN_REPLACE_SPN_OP => 1

    /**
     * Deletes the specified SPNs from the object identified by the <i>pszAccount</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dswriteaccountspna">DsWriteAccountSpn</a>.
     * @type {Integer (Int32)}
     */
    static DS_SPN_DELETE_SPN_OP => 2
}
