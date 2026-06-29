#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EFS_RPC_BLOB.ahk" { EFS_RPC_BLOB }
#Import ".\ENCRYPTION_CERTIFICATE.ahk" { ENCRYPTION_CERTIFICATE }
#Import ".\ENCRYPTION_CERTIFICATE_HASH_LIST.ahk" { ENCRYPTION_CERTIFICATE_HASH_LIST }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTED_FILE_METADATA_SIGNATURE {
    #StructPack 8

    dwEfsAccessType : UInt32

    pCertificatesAdded : ENCRYPTION_CERTIFICATE_HASH_LIST.Ptr

    pEncryptionCertificate : ENCRYPTION_CERTIFICATE.Ptr

    pEfsStreamSignature : EFS_RPC_BLOB.Ptr

}
