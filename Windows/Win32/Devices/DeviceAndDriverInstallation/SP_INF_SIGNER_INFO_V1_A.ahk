#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_INF_SIGNER_INFO structure stores information about an INF file's digital signature. (sp_inf_signer_info_v1_a)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines SP_INF_SIGNER_INFO_V1 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_inf_signer_info_v1_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_INF_SIGNER_INFO_V1_A extends Win32Struct
{
    static sizeof => 784

    static packingSize => 4

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Path to the catalog file, stored in an array of maximum size MAX_PATH characters.
     * @type {String}
     */
    CatalogFile {
        get => StrGet(this.ptr + 4, 259, "UTF-8")
        set => StrPut(value, this.ptr + 4, 259, "UTF-8")
    }

    /**
     * Path to the digital signer of the file, stored in an array of maximum size MAX_PATH characters.
     * @type {String}
     */
    DigitalSigner {
        get => StrGet(this.ptr + 264, 259, "UTF-8")
        set => StrPut(value, this.ptr + 264, 259, "UTF-8")
    }

    /**
     * Version of the digital signer, stored in an array of size MAX_PATH characters.
     * @type {String}
     */
    DigitalSignerVersion {
        get => StrGet(this.ptr + 524, 259, "UTF-8")
        set => StrPut(value, this.ptr + 524, 259, "UTF-8")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 784
    }
}
