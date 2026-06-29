#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }

/**
 * Contains a biometric template and associated data in a standard format.
 * @remarks
 * The <b>WINBIO_STORAGE_RECORD</b> structure and the memory it points to are the property of the component that created the structure. In particular, the component determines when the structure is deleted and when its embedded pointers become invalid. When other components are given temporary access to this structure, they must follow the rules  governing structure  lifetime set by the owning component.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_record
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_STORAGE_RECORD {
    #StructPack 8

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the storage record.
     */
    Identity : WINBIO_IDENTITY.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-biometric-subtype-constants">WINBIO_BIOMETRIC_SUBTYPE</a> value that specifies the biometric sub-factor associated with the template data.
     * 
     * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> value. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
     * 
     * </div>
     * <div> </div>
     */
    SubFactor : Int8

    /**
     * Pointer to a contiguous array of <b>ULONG</b> values. These values represent the bucket address assigned to the biometric template by the engine adapter.
     */
    IndexVector : IntPtr

    /**
     * The number of <b>ULONG</b> values in the array specified by the <i>IndexVector</i> field.
     */
    IndexElementCount : IntPtr

    /**
     * Pointer to an array of bytes that contains the biometric template data.
     */
    TemplateBlob : IntPtr

    /**
     * Size, in bytes, of the template specified by the <i>TemplateBlob</i> parameter.
     */
    TemplateBlobSize : IntPtr

    /**
     * Pointer to an array of bytes that contains integrity checking data. This field is used only by adapters for removable devices that contain embedded storage.
     */
    PayloadBlob : IntPtr

    /**
     * Size, in bytes, of the data specified by the <i>PayloadBlob</i> parameter.
     */
    PayloadBlobSize : IntPtr

}
