#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a biometric template and associated data in a standard format.
 * @remarks
 * The <b>WINBIO_STORAGE_RECORD</b> structure and the memory it points to are the property of the component that created the structure. In particular, the component determines when the structure is deleted and when its embedded pointers become invalid. When other components are given temporary access to this structure, they must follow the rules  governing structure  lifetime set by the owning component.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_record
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_STORAGE_RECORD extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the storage record.
     * @type {Pointer<WINBIO_IDENTITY>}
     */
    Identity {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-biometric-subtype-constants">WINBIO_BIOMETRIC_SUBTYPE</a> value that specifies the biometric sub-factor associated with the template data.
     * 
     * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> value. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
     * 
     * </div>
     * <div> </div>
     * @type {Integer}
     */
    SubFactor {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Pointer to a contiguous array of <b>ULONG</b> values. These values represent the bucket address assigned to the biometric template by the engine adapter.
     * @type {Pointer<UInt32>}
     */
    IndexVector {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of <b>ULONG</b> values in the array specified by the <i>IndexVector</i> field.
     * @type {Pointer}
     */
    IndexElementCount {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to an array of bytes that contains the biometric template data.
     * @type {Pointer<Byte>}
     */
    TemplateBlob {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Size, in bytes, of the template specified by the <i>TemplateBlob</i> parameter.
     * @type {Pointer}
     */
    TemplateBlobSize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to an array of bytes that contains integrity checking data. This field is used only by adapters for removable devices that contain embedded storage.
     * @type {Pointer<Byte>}
     */
    PayloadBlob {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Size, in bytes, of the data specified by the <i>PayloadBlob</i> parameter.
     * @type {Pointer}
     */
    PayloadBlobSize {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
