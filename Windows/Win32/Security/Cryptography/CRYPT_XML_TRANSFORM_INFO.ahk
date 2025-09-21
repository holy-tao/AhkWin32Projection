#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used when applying the data transform.
 * @remarks
 * For XML canonicalization transforms, the buffer size specified by the <b>cbBufferSize</b> member must be large enough to accommodate an entire <b>Start</b> element with all attribute values.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_transform_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_TRANSFORM_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the <b>Algorithm</b> attribute.
     * @type {Pointer<Char>}
     */
    wszAlgorithm {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the data provider's buffer. The size can be zero if the size cannot be determined at initialization time.
     *     This value is used by a caller of the structure pointed to by the <b>pfnCreateTransform</b> member to determine the necessary size of the receiving buffer.
     * @type {Integer}
     */
    cbBufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies values that control how the transform is applied.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_create_transform">PFN_CRYPT_XML_CREATE_TRANSFORM</a> callback function used to create the transform.
     * @type {Pointer<PFN_CRYPT_XML_CREATE_TRANSFORM>}
     */
    pfnCreateTransform {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
