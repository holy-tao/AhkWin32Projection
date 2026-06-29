#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SP_INF_SIGNER_INFO structure stores information about an INF file's digital signature. (sp_inf_signer_info_v2_a)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_INF_SIGNER_INFO_V2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_inf_signer_info_v2_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct SP_INF_SIGNER_INFO_V2_A {
    #StructPack 4

    /**
     * Size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Path to the catalog file, stored in an array of maximum size MAX_PATH characters.
     */
    CatalogFile : CHAR[260]

    /**
     * Path to the digital signer of the file, stored in an array of maximum size MAX_PATH characters.
     */
    DigitalSigner : CHAR[260]

    /**
     * Version of the digital signer, stored in an array of size MAX_PATH characters.
     */
    DigitalSignerVersion : CHAR[260]

    SignerScore : UInt32

}
