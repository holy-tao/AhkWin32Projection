#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADMIN_OTHER_INFO structure contains error message information. The NetAlertRaise and NetAlertRaiseEx functions use the ADMIN_OTHER_INFO structure to specify information when raising an administrator's interrupting message.
 * @remarks
 * Variable-length data follows the 
 * <b>ADMIN_OTHER_INFO</b> structure in the alert message buffer if you specify one or more strings in the <b>alrtad_numstrings</b> member. The calling application must allocate and free the memory for all structures and variable-length data in an alert message buffer.
 * 
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraise">NetAlertRaise</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraiseex">NetAlertRaiseEx</a> for code samples that demonstrate how to raise an administrative alert.
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/ns-lmalert-admin_other_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct ADMIN_OTHER_INFO {
    #StructPack 4

    /**
     * Specifies the error code for the new message written to the message log.
     */
    alrtad_errcode : UInt32

    /**
     * Specifies the number (0-9) of consecutive Unicode strings written to the message log.
     */
    alrtad_numstrings : UInt32

}
