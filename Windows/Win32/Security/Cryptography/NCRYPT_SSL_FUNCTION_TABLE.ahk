#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_SSL_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    ComputeClientAuthHash : IntPtr

    ComputeEapKeyBlock : IntPtr

    ComputeFinishedHash : IntPtr

    CreateEphemeralKey : IntPtr

    CreateHandshakeHash : IntPtr

    DecryptPacket : IntPtr

    EncryptPacket : IntPtr

    EnumCipherSuites : IntPtr

    ExportKey : IntPtr

    FreeBuffer : IntPtr

    FreeObject : IntPtr

    GenerateMasterKey : IntPtr

    GenerateSessionKeys : IntPtr

    GetKeyProperty : IntPtr

    GetProviderProperty : IntPtr

    HashHandshake : IntPtr

    ImportMasterKey : IntPtr

    ImportKey : IntPtr

    LookupCipherSuiteInfo : IntPtr

    OpenPrivateKey : IntPtr

    OpenProvider : IntPtr

    SignHash : IntPtr

    VerifySignature : IntPtr

    LookupCipherLengths : IntPtr

    CreateClientAuthHash : IntPtr

    GetCipherSuitePRFHashAlgorithm : IntPtr

    ComputeSessionHash : IntPtr

    GeneratePreMasterKey : IntPtr

    EnumEccCurves : IntPtr

    ExportKeyingMaterial : IntPtr

    ExtractEarlyKey : IntPtr

    ExtractHandshakeKey : IntPtr

    ExtractMasterKey : IntPtr

    ExpandTrafficKeys : IntPtr

    ExpandWriteKey : IntPtr

    ExpandExporterMasterKey : IntPtr

    EnumCipherSuitesEx : IntPtr

    ExpandResumptionMasterKey : IntPtr

    DuplicateTranscriptHash : IntPtr

    ExpandBinderKey : IntPtr

    ExpandPreSharedKey : IntPtr

}
