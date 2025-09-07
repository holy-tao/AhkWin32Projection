#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to contain a collection of BCRYPT_OID structures. Use this structure with the BCRYPT_HASH_OID_LIST property to retrieve the list of hashing object identifiers (OIDs) that have been encoded by using Distinguished Encoding Rules (DER) encoding.
 * @remarks
 * The first OID in the <b>pOIDs</b> array is used to identify any hashes or signatures created by this algorithm provider. When verifying a hash or signature, all the OIDs in the array are treated as valid.
  * 
  * In the Microsoft Primitive Provider implementation, <b>dwOIDCount</b> is 2, so that the <b>pOIDs</b> array contains two members:
  * 
  * <ul>
  * <li><b>pOIDs[0]</b> contains a DER-encoded <b>AlgorithmIdentifier</b> with a <b>NULL</b> parameter.</li>
  * <li><b>pOIDs[1]</b> contains the DER-encoded <b>AlgorithmIdentifier</b> without a <b>NULL</b> parameter.</li>
  * </ul>
  * For example, the SHA-1 encoding would be:
  * 
  * <ul>
  * <li><b>pOIDs[0]</b> --&gt; 06 05 2b 0e 03 02 1a 05 00
  * 
  * </li>
  * <li><b>pOIDs[1]</b> --&gt; 06 05 2b 0e 03 02 1a</li>
  * </ul>
  * 
  * 
  * The following snippet describes an <b>AlgorithmIdentifier</b> in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) notation.  <b>SEQUENCE</b>, <b>OBJECT IDENTIFIER</b>, and <b>ANY</b> are DER encoded. The <b>ANY</b> BLOB is <b>NULL</b>.
  * 
  * 
  * ``` syntax
  * AlgorithmIdentifier ::= SEQUENCE {
  *    algorithm            OBJECT IDENTIFIER,
  *    algorithmParams      ANY
  * }
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_oid_list
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_OID_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>pOIDs</b> array.
     * @type {Integer}
     */
    dwOIDCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-bcrypt_oid">BCRYPT_OID</a> structures that contains OIDs.
     * @type {Pointer<BCRYPT_OID>}
     */
    pOIDs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
