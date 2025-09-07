#Requires AutoHotkey v2.0.0 64-bit

/**
 * A bitwise enumerator that indicates which, if any, optional parts of an XPS document are signed.
 * @remarks
 * More than one value may be set.
 * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_policy
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_SIGN_POLICY{

    /**
     * No optional parts or relationships are signed.
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_POLICY_NONE => 0

    /**
     * The CoreProperties part and the relationships that include it are signed.
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_POLICY_CORE_PROPERTIES => 1

    /**
     * The signature relationships  from the signature origin part are signed. <i>Signature relationships</i> are those relationships that have a <i>digital signature</i> relationship type.
 * 
 * <div class="alert"><b>Note</b>  <p class="note">Setting the <b>XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS</b> flag will cause the signature relationships that start from the signature origin part to be signed. Signatures that are made with this flag set will break when new signatures are added later, because new  signatures  add new signature relationships.
 * 
 * </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS => 2

    /**
     * The  PrintTicket part and the relationships that include it are signed.
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_POLICY_PRINT_TICKET => 4

    /**
     * The  DiscardControl part and the relationships that include it are signed.
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_POLICY_DISCARD_CONTROL => 8

    /**
     * The  CoreProperties part and the relationships that include it, the digital signature relationship type from the SignatureOrigin part, the PrintTicket part and the relationships that include it, and the DiscardControl part and the relationships that include it are all signed.
 * 
 * <div class="alert"><b>Note</b>  <p class="note">Setting the <b>XPS_SIGN_POLICY_ALL</b> sets the <b>XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS</b> flag, which will cause the signature relationships that start from the signature origin part to be signed. Signatures that are made with this flag set will break when new signatures are added later, because new  signatures  add new signature relationships.
 * 
 * </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static XPS_SIGN_POLICY_ALL => 15
}
