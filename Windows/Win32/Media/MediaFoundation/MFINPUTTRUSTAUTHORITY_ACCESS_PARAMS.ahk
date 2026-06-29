#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFPOLICYMANAGER_ACTION.ahk" { MFPOLICYMANAGER_ACTION }
#Import ".\MFINPUTTRUSTAUTHORITY_ACCESS_ACTION.ahk" { MFINPUTTRUSTAUTHORITY_ACCESS_ACTION }

/**
 * Contains parameters for the IMFInputTrustAuthority::BindAccess or IMFInputTrustAuthority::UpdateAccess method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfinputtrustauthority_access_params
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS {
    #StructPack 8

    /**
     * Size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Version number. This value must be zero.
     */
    dwVer : UInt32

    /**
     * Offset of the signature from the start of the structure, in bytes.
     */
    cbSignatureOffset : UInt32

    /**
     * Size of the signature, in bytes.
     */
    cbSignatureSize : UInt32

    /**
     * Offset of the extension blob from the start of the structure, in bytes.
     */
    cbExtensionOffset : UInt32

    /**
     * Size of the extension blob, in bytes.
     */
    cbExtensionSize : UInt32

    /**
     * Number of elements in the <b>rgOutputActions</b> array.
     */
    cActions : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfinputtrustauthority_access_action">MFINPUTTRUSTAUTHORITY_ACCESS_ACTION</a> structures. The number of elements in the array is specified in the <b>cActions</b> member.
     */
    rgOutputActions : MFINPUTTRUSTAUTHORITY_ACCESS_ACTION[1]

}
