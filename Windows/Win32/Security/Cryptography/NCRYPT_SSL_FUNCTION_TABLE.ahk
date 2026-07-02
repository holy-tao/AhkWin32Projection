#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SslEnumCipherSuitesFn.ahk" { SslEnumCipherSuitesFn }
#Import ".\SslDecryptPacketFn.ahk" { SslDecryptPacketFn }
#Import ".\SslExtractEarlyKeyFn.ahk" { SslExtractEarlyKeyFn }
#Import ".\SslVerifySignatureFn.ahk" { SslVerifySignatureFn }
#Import ".\SslCreateHandshakeHashFn.ahk" { SslCreateHandshakeHashFn }
#Import ".\SslImportMasterKeyFn.ahk" { SslImportMasterKeyFn }
#Import ".\SslGetProviderPropertyFn.ahk" { SslGetProviderPropertyFn }
#Import ".\SslFreeBufferFn.ahk" { SslFreeBufferFn }
#Import ".\SslEnumCipherSuitesExFn.ahk" { SslEnumCipherSuitesExFn }
#Import ".\SslExpandWriteKeyFn.ahk" { SslExpandWriteKeyFn }
#Import ".\SslCreateEphemeralKeyFn.ahk" { SslCreateEphemeralKeyFn }
#Import ".\SslExportKeyFn.ahk" { SslExportKeyFn }
#Import ".\SslComputeEapKeyBlockFn.ahk" { SslComputeEapKeyBlockFn }
#Import ".\SslDuplicateTranscriptHashFn.ahk" { SslDuplicateTranscriptHashFn }
#Import ".\SslGetKeyPropertyFn.ahk" { SslGetKeyPropertyFn }
#Import ".\SslComputeClientAuthHashFn.ahk" { SslComputeClientAuthHashFn }
#Import ".\SslExpandExporterMasterKeyFn.ahk" { SslExpandExporterMasterKeyFn }
#Import ".\SslGenerateMasterKeyFn.ahk" { SslGenerateMasterKeyFn }
#Import ".\SslExpandBinderKeyFn.ahk" { SslExpandBinderKeyFn }
#Import ".\SslGeneratePreMasterKeyFn.ahk" { SslGeneratePreMasterKeyFn }
#Import ".\SslExpandPreSharedKeyFn.ahk" { SslExpandPreSharedKeyFn }
#Import ".\SslLookupCipherLengthsFn.ahk" { SslLookupCipherLengthsFn }
#Import ".\SslEncryptPacketFn.ahk" { SslEncryptPacketFn }
#Import ".\SslCreateClientAuthHashFn.ahk" { SslCreateClientAuthHashFn }
#Import ".\SslGetCipherSuitePRFHashAlgorithmFn.ahk" { SslGetCipherSuitePRFHashAlgorithmFn }
#Import ".\SslComputeFinishedHashFn.ahk" { SslComputeFinishedHashFn }
#Import ".\SslExpandResumptionMasterKeyFn.ahk" { SslExpandResumptionMasterKeyFn }
#Import ".\SslEnumEccCurvesFn.ahk" { SslEnumEccCurvesFn }
#Import ".\SslExtractMasterKeyFn.ahk" { SslExtractMasterKeyFn }
#Import ".\SslComputeSessionHashFn.ahk" { SslComputeSessionHashFn }
#Import ".\SslExpandTrafficKeysFn.ahk" { SslExpandTrafficKeysFn }
#Import ".\SslGenerateSessionKeysFn.ahk" { SslGenerateSessionKeysFn }
#Import ".\SslOpenProviderFn.ahk" { SslOpenProviderFn }
#Import ".\SslImportKeyFn.ahk" { SslImportKeyFn }
#Import ".\SslHashHandshakeFn.ahk" { SslHashHandshakeFn }
#Import ".\SslSignHashFn.ahk" { SslSignHashFn }
#Import ".\SslOpenPrivateKeyFn.ahk" { SslOpenPrivateKeyFn }
#Import ".\SslFreeObjectFn.ahk" { SslFreeObjectFn }
#Import ".\SslExtractHandshakeKeyFn.ahk" { SslExtractHandshakeKeyFn }
#Import ".\SslLookupCipherSuiteInfoFn.ahk" { SslLookupCipherSuiteInfoFn }
#Import ".\SslExportKeyingMaterialFn.ahk" { SslExportKeyingMaterialFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

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
