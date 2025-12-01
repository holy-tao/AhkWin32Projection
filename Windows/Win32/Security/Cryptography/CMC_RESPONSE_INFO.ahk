#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides a means of communicating different pieces of tagged information. (CMC_RESPONSE_INFO)
 * @remarks
 * All tagged arrays are optional.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_response_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Count of the number of elements in the <b>rgTaggedAttribute</b> member array.
     * @type {Integer}
     */
    cTaggedAttribute {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmc_tagged_attribute">CMC_TAGGED_ATTRIBUTE</a> structures.
     * @type {Pointer<CMC_TAGGED_ATTRIBUTE>}
     */
    rgTaggedAttribute {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Count of the number of elements in the <b>rgTaggedContentInfo</b> member array.
     * @type {Integer}
     */
    cTaggedContentInfo {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmc_tagged_content_info">CMC_TAGGED_CONTENT_INFO</a> structures.
     * @type {Pointer<CMC_TAGGED_CONTENT_INFO>}
     */
    rgTaggedContentInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Count of the number of elements in the <b>rgTaggedOtherMsg</b> member array.
     * @type {Integer}
     */
    cTaggedOtherMsg {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmc_tagged_other_msg">CMC_TAGGED_OTHER_MSG</a> structures.
     * @type {Pointer<CMC_TAGGED_OTHER_MSG>}
     */
    rgTaggedOtherMsg {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
