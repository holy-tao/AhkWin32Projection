#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the IMFLocalMFTRegistration::RegisterMFTs method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mft_registration_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_REGISTRATION_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * CLSID of the Media Foundation transform (MFT) to register.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @type {Pointer<Guid>}
     */
    guidCategory {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     * @type {Integer}
     */
    uiFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Wide-character string that contains the friendly name of the MFT.
     * @type {Pointer<PWSTR>}
     */
    pszName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Number of elements in the <b>pInTypes</b> array.
     * @type {Integer}
     */
    cInTypes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports. If this member is <b>NULL</b>, the <b>cInTypes</b> member must be zero.
     * @type {Pointer<MFT_REGISTER_TYPE_INFO>}
     */
    pInTypes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Number of elements in the <b>pOutTypes</b> array.
     * @type {Integer}
     */
    cOutTypes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. If this member is <b>NULL</b>, the <b>cOutTypes</b> member must be zero.
     * @type {Pointer<MFT_REGISTER_TYPE_INFO>}
     */
    pOutTypes {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
