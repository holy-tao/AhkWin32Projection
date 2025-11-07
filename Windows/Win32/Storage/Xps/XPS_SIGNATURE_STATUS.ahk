#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the status of a document's digital signature.
 * @remarks
 * 
 * The digital signature status values correspond to section 10.2.1.2 in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * 
 * The Open Packaging Conventions are specified in   the 1st edition, Part 2, "Open Packaging Conventions," of <a href="https://www.ecma-international.org/publications/standards/Ecma-376.htm">Standard ECMA-376, Office Open XML File Formats</a>.
 * 
 * <div class="alert"><b>Note</b>  These resources may not be available in some languages 
 * 
 * and countries.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/ne-xpsdigitalsignature-xps_signature_status
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_SIGNATURE_STATUS{

    /**
     * The signature violates one or more  signing rules stated in section 10.2.1.2 of the   <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>. These rules describe the parts or relationships that must or must not be signed.
     * 
     * A signature that is incompliant must be created as such. 
     * Changing signed content cannot make a valid signature incompliant. One example of an incompliant signature  is the signature of a   package that has an unknown relationships type at the root.
     * @type {Integer (Int32)}
     */
    static XPS_SIGNATURE_STATUS_INCOMPLIANT => 1

    /**
     * The signature does not include parts that must be signed.
     * 
     * If a valid XPS signature is created and the XPS document contents are later modified, the signature will become incomplete or broken.
     * For example, removing a page from a FixedDocument makes the signature incomplete; it also breaks the signature,  but  the fact that the signature is incomplete is of greater importance.
     * @type {Integer (Int32)}
     */
    static XPS_SIGNATURE_STATUS_INCOMPLETE => 2

    /**
     * This is a compliant digital signature, but it fails the signature validation routines described in the <i>Open Packaging Conventions</i> (refer to See Also).
     * 
     * Modification of the markup in a FixedPage that has been signed breaks the signature.
     * @type {Integer (Int32)}
     */
    static XPS_SIGNATURE_STATUS_BROKEN => 3

    /**
     * This is not an incompliant or broken digital signature, but the signed content (parts and relationships) includes elements or attributes from an unknown namespace introduced through the markup compatibility mechanisms.
     * @type {Integer (Int32)}
     */
    static XPS_SIGNATURE_STATUS_QUESTIONABLE => 4

    /**
     * This is a valid signature: it is not broken, incompliant, or questionable. The application, however,  must still check the certificate trust chain, revocation lists, and expiration dates.
     * @type {Integer (Int32)}
     */
    static XPS_SIGNATURE_STATUS_VALID => 5
}
