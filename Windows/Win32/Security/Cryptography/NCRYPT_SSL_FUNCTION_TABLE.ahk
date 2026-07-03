#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\SslComputeClientAuthHashFn.ahk" { SslComputeClientAuthHashFn }
#Import ".\SslComputeEapKeyBlockFn.ahk" { SslComputeEapKeyBlockFn }
#Import ".\SslComputeFinishedHashFn.ahk" { SslComputeFinishedHashFn }
#Import ".\SslComputeSessionHashFn.ahk" { SslComputeSessionHashFn }
#Import ".\SslCreateClientAuthHashFn.ahk" { SslCreateClientAuthHashFn }
#Import ".\SslCreateEphemeralKeyFn.ahk" { SslCreateEphemeralKeyFn }
#Import ".\SslCreateHandshakeHashFn.ahk" { SslCreateHandshakeHashFn }
#Import ".\SslDecryptPacketFn.ahk" { SslDecryptPacketFn }
#Import ".\SslDuplicateTranscriptHashFn.ahk" { SslDuplicateTranscriptHashFn }
#Import ".\SslEncryptPacketFn.ahk" { SslEncryptPacketFn }
#Import ".\SslEnumCipherSuitesExFn.ahk" { SslEnumCipherSuitesExFn }
#Import ".\SslEnumCipherSuitesFn.ahk" { SslEnumCipherSuitesFn }
#Import ".\SslEnumEccCurvesFn.ahk" { SslEnumEccCurvesFn }
#Import ".\SslExpandBinderKeyFn.ahk" { SslExpandBinderKeyFn }
#Import ".\SslExpandExporterMasterKeyFn.ahk" { SslExpandExporterMasterKeyFn }
#Import ".\SslExpandPreSharedKeyFn.ahk" { SslExpandPreSharedKeyFn }
#Import ".\SslExpandResumptionMasterKeyFn.ahk" { SslExpandResumptionMasterKeyFn }
#Import ".\SslExpandTrafficKeysFn.ahk" { SslExpandTrafficKeysFn }
#Import ".\SslExpandWriteKeyFn.ahk" { SslExpandWriteKeyFn }
#Import ".\SslExportKeyFn.ahk" { SslExportKeyFn }
#Import ".\SslExportKeyingMaterialFn.ahk" { SslExportKeyingMaterialFn }
#Import ".\SslExtractEarlyKeyFn.ahk" { SslExtractEarlyKeyFn }
#Import ".\SslExtractHandshakeKeyFn.ahk" { SslExtractHandshakeKeyFn }
#Import ".\SslExtractMasterKeyFn.ahk" { SslExtractMasterKeyFn }
#Import ".\SslFreeBufferFn.ahk" { SslFreeBufferFn }
#Import ".\SslFreeObjectFn.ahk" { SslFreeObjectFn }
#Import ".\SslGenerateMasterKeyFn.ahk" { SslGenerateMasterKeyFn }
#Import ".\SslGeneratePreMasterKeyFn.ahk" { SslGeneratePreMasterKeyFn }
#Import ".\SslGenerateSessionKeysFn.ahk" { SslGenerateSessionKeysFn }
#Import ".\SslGetCipherSuitePRFHashAlgorithmFn.ahk" { SslGetCipherSuitePRFHashAlgorithmFn }
#Import ".\SslGetKeyPropertyFn.ahk" { SslGetKeyPropertyFn }
#Import ".\SslGetProviderPropertyFn.ahk" { SslGetProviderPropertyFn }
#Import ".\SslHashHandshakeFn.ahk" { SslHashHandshakeFn }
#Import ".\SslImportKeyFn.ahk" { SslImportKeyFn }
#Import ".\SslImportMasterKeyFn.ahk" { SslImportMasterKeyFn }
#Import ".\SslLookupCipherLengthsFn.ahk" { SslLookupCipherLengthsFn }
#Import ".\SslLookupCipherSuiteInfoFn.ahk" { SslLookupCipherSuiteInfoFn }
#Import ".\SslOpenPrivateKeyFn.ahk" { SslOpenPrivateKeyFn }
#Import ".\SslOpenProviderFn.ahk" { SslOpenProviderFn }
#Import ".\SslSignHashFn.ahk" { SslSignHashFn }
#Import ".\SslVerifySignatureFn.ahk" { SslVerifySignatureFn }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_SSL_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    ComputeClientAuthHash : SslComputeClientAuthHashFn

    ComputeEapKeyBlock : SslComputeEapKeyBlockFn

    ComputeFinishedHash : SslComputeFinishedHashFn

    CreateEphemeralKey : SslCreateEphemeralKeyFn

    CreateHandshakeHash : SslCreateHandshakeHashFn

    DecryptPacket : SslDecryptPacketFn

    EncryptPacket : SslEncryptPacketFn

    EnumCipherSuites : SslEnumCipherSuitesFn

    ExportKey : SslExportKeyFn

    FreeBuffer : SslFreeBufferFn

    FreeObject : SslFreeObjectFn

    GenerateMasterKey : SslGenerateMasterKeyFn

    GenerateSessionKeys : SslGenerateSessionKeysFn

    GetKeyProperty : SslGetKeyPropertyFn

    GetProviderProperty : SslGetProviderPropertyFn

    HashHandshake : SslHashHandshakeFn

    ImportMasterKey : SslImportMasterKeyFn

    ImportKey : SslImportKeyFn

    LookupCipherSuiteInfo : SslLookupCipherSuiteInfoFn

    OpenPrivateKey : SslOpenPrivateKeyFn

    OpenProvider : SslOpenProviderFn

    SignHash : SslSignHashFn

    VerifySignature : SslVerifySignatureFn

    LookupCipherLengths : SslLookupCipherLengthsFn

    CreateClientAuthHash : SslCreateClientAuthHashFn

    GetCipherSuitePRFHashAlgorithm : SslGetCipherSuitePRFHashAlgorithmFn

    ComputeSessionHash : SslComputeSessionHashFn

    GeneratePreMasterKey : SslGeneratePreMasterKeyFn

    EnumEccCurves : SslEnumEccCurvesFn

    ExportKeyingMaterial : SslExportKeyingMaterialFn

    ExtractEarlyKey : SslExtractEarlyKeyFn

    ExtractHandshakeKey : SslExtractHandshakeKeyFn

    ExtractMasterKey : SslExtractMasterKeyFn

    ExpandTrafficKeys : SslExpandTrafficKeysFn

    ExpandWriteKey : SslExpandWriteKeyFn

    ExpandExporterMasterKey : SslExpandExporterMasterKeyFn

    EnumCipherSuitesEx : SslEnumCipherSuitesExFn

    ExpandResumptionMasterKey : SslExpandResumptionMasterKeyFn

    DuplicateTranscriptHash : SslDuplicateTranscriptHashFn

    ExpandBinderKey : SslExpandBinderKeyFn

    ExpandPreSharedKey : SslExpandPreSharedKeyFn

}
