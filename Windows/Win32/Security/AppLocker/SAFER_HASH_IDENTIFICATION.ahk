#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAFER_IDENTIFICATION_HEADER.ahk" { SAFER_IDENTIFICATION_HEADER }
#Import ".\SAFER_IDENTIFICATION_TYPES.ahk" { SAFER_IDENTIFICATION_TYPES }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Cryptography\ALG_ID.ahk" { ALG_ID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a hash identification rule.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_hash_identification
 * @namespace Windows.Win32.Security.AppLocker
 */
export default struct SAFER_HASH_IDENTIFICATION {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure containing the structure header. The <b>dwIdentificationType</b> member  of the header must be <b>SaferIdentityTypeImageHash</b>, and the <b>cbStructSize</b> member  of the header must be sizeof(SAFER_HASH_IDENTIFICATION).
     */
    header : SAFER_IDENTIFICATION_HEADER

    /**
     * A description of the hash identification rule provided by the user.
     */
    Description : WCHAR[256]

    /**
     * A human-readable name for the hash identification rule.
     */
    FriendlyName : WCHAR[256]

    /**
     * The size of the <b>ImageHash</b> member in bytes. For example, if the algorithm specified by the <b>HashAlgorithm</b> member is MD5, the size is 16.
     */
    HashSize : UInt32

    /**
     * The computed hash of the code image.
     */
    ImageHash : Int8[64]

    /**
     * The algorithm used to compute the hash.
     */
    HashAlgorithm : ALG_ID

    /**
     * The size of the original file in bytes.
     */
    ImageSize : Int64

    /**
     * Reserved for future use.
     */
    dwSaferFlags : UInt32

}
