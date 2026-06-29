#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MFT_REGISTER_TYPE_INFO.ahk" { MFT_REGISTER_TYPE_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains parameters for the IMFLocalMFTRegistration::RegisterMFTs method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mft_registration_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_REGISTRATION_INFO {
    #StructPack 8

    /**
     * CLSID of the Media Foundation transform (MFT) to register.
     */
    clsid : Guid

    /**
     * GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     */
    guidCategory : Guid

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     */
    uiFlags : UInt32

    /**
     * Wide-character string that contains the friendly name of the MFT.
     */
    pszName : PWSTR

    /**
     * Number of elements in the <b>pInTypes</b> array.
     */
    cInTypes : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports. If this member is <b>NULL</b>, the <b>cInTypes</b> member must be zero.
     */
    pInTypes : MFT_REGISTER_TYPE_INFO.Ptr

    /**
     * Number of elements in the <b>pOutTypes</b> array.
     */
    cOutTypes : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. If this member is <b>NULL</b>, the <b>cOutTypes</b> member must be zero.
     */
    pOutTypes : MFT_REGISTER_TYPE_INFO.Ptr

}
