#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * The CRYPTCATATTRIBUTE structure defines a catalog attribute. This structure is used by the CryptCATEnumerateAttr and CryptCATEnumerateCatAttr functions.
 * @see https://docs.microsoft.com/windows/win32/api//mscat/ns-mscat-cryptcatattribute
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCATATTRIBUTE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the reference tag value.
     * @type {PWSTR}
     */
    pwszReferenceTag{
        get {
            if(!this.HasProp("__pwszReferenceTag"))
                this.__pwszReferenceTag := PWSTR(this.ptr + 8)
            return this.__pwszReferenceTag
        }
    }

    /**
     * Bitwise combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_AUTHENTICATED"></a><a id="cryptcat_attr_authenticated"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_AUTHENTICATED</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_UNAUTHENTICATED"></a><a id="cryptcat_attr_unauthenticated"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_UNAUTHENTICATED</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is unauthenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_NAMEASCII"></a><a id="cryptcat_attr_nameascii"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_NAMEASCII</b></dt>
     * <dt>             0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is an ASCII string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_NAMEOBJID"></a><a id="cryptcat_attr_nameobjid"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_NAMEOBJID</b></dt>
     * <dt>             0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is a cryptographic object identifier (OID).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATAASCII"></a><a id="cryptcat_attr_dataascii"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATAASCII</b></dt>
     * <dt>             0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute contains simple ASCII characters that should not be decoded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATABASE64"></a><a id="cryptcat_attr_database64"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATABASE64</b></dt>
     * <dt>            0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is in base 64 format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATAREPLACE"></a><a id="cryptcat_attr_datareplace"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATAREPLACE</b></dt>
     * <dt>           0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute replaces the value for an existing attribute.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwAttrTypeAndAction {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of bytes used by <b>pbValue</b>.
     * @type {Integer}
     */
    cbValue {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to the encoded bytes.
     * @type {Pointer<Byte>}
     */
    pbValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
