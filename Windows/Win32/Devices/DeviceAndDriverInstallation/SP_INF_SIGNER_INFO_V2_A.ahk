#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_INF_SIGNER_INFO structure stores information about an INF file's digital signature. (sp_inf_signer_info_v2_a)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines SP_INF_SIGNER_INFO_V2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_inf_signer_info_v2_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_INF_SIGNER_INFO_V2_A extends Win32Struct
{
    static sizeof => 788

    static packingSize => 1

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
     * @type {Array<SByte>}
     */
    CatalogFile{
        get {
            if(!this.HasProp("__CatalogFileProxyArray"))
                this.__CatalogFileProxyArray := Win32FixedArray(this.ptr + 4, 260, Primitive, "char")
            return this.__CatalogFileProxyArray
        }
    }

    /**
     * Path to the digital signer of the file, stored in an array of maximum size MAX_PATH characters.
     * @type {Array<SByte>}
     */
    DigitalSigner{
        get {
            if(!this.HasProp("__DigitalSignerProxyArray"))
                this.__DigitalSignerProxyArray := Win32FixedArray(this.ptr + 264, 260, Primitive, "char")
            return this.__DigitalSignerProxyArray
        }
    }

    /**
     * Version of the digital signer, stored in an array of size MAX_PATH characters.
     * @type {Array<SByte>}
     */
    DigitalSignerVersion{
        get {
            if(!this.HasProp("__DigitalSignerVersionProxyArray"))
                this.__DigitalSignerVersionProxyArray := Win32FixedArray(this.ptr + 524, 260, Primitive, "char")
            return this.__DigitalSignerVersionProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    SignerScore {
        get => NumGet(this, 784, "uint")
        set => NumPut("uint", value, this, 784)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 788
    }
}
