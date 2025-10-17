#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BCRYPT_INTERFACE_VERSION.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_SSL_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 336

    static packingSize => 8

    /**
     * @type {BCRYPT_INTERFACE_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := BCRYPT_INTERFACE_VERSION(0, this)
            return this.__Version
        }
    }

    /**
     * @type {Pointer<SslComputeClientAuthHashFn>}
     */
    ComputeClientAuthHash {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SslComputeEapKeyBlockFn>}
     */
    ComputeEapKeyBlock {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<SslComputeFinishedHashFn>}
     */
    ComputeFinishedHash {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<SslCreateEphemeralKeyFn>}
     */
    CreateEphemeralKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<SslCreateHandshakeHashFn>}
     */
    CreateHandshakeHash {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<SslDecryptPacketFn>}
     */
    DecryptPacket {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<SslEncryptPacketFn>}
     */
    EncryptPacket {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<SslEnumCipherSuitesFn>}
     */
    EnumCipherSuites {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<SslExportKeyFn>}
     */
    ExportKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<SslFreeBufferFn>}
     */
    FreeBuffer {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<SslFreeObjectFn>}
     */
    FreeObject {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<SslGenerateMasterKeyFn>}
     */
    GenerateMasterKey {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<SslGenerateSessionKeysFn>}
     */
    GenerateSessionKeys {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<SslGetKeyPropertyFn>}
     */
    GetKeyProperty {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<SslGetProviderPropertyFn>}
     */
    GetProviderProperty {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<SslHashHandshakeFn>}
     */
    HashHandshake {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<SslImportMasterKeyFn>}
     */
    ImportMasterKey {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<SslImportKeyFn>}
     */
    ImportKey {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<SslLookupCipherSuiteInfoFn>}
     */
    LookupCipherSuiteInfo {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<SslOpenPrivateKeyFn>}
     */
    OpenPrivateKey {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<SslOpenProviderFn>}
     */
    OpenProvider {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<SslSignHashFn>}
     */
    SignHash {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<SslVerifySignatureFn>}
     */
    VerifySignature {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<SslLookupCipherLengthsFn>}
     */
    LookupCipherLengths {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<SslCreateClientAuthHashFn>}
     */
    CreateClientAuthHash {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<SslGetCipherSuitePRFHashAlgorithmFn>}
     */
    GetCipherSuitePRFHashAlgorithm {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<SslComputeSessionHashFn>}
     */
    ComputeSessionHash {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<SslGeneratePreMasterKeyFn>}
     */
    GeneratePreMasterKey {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<SslEnumEccCurvesFn>}
     */
    EnumEccCurves {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<SslExportKeyingMaterialFn>}
     */
    ExportKeyingMaterial {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<SslExtractEarlyKeyFn>}
     */
    ExtractEarlyKey {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<SslExtractHandshakeKeyFn>}
     */
    ExtractHandshakeKey {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<SslExtractMasterKeyFn>}
     */
    ExtractMasterKey {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<SslExpandTrafficKeysFn>}
     */
    ExpandTrafficKeys {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<SslExpandWriteKeyFn>}
     */
    ExpandWriteKey {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<SslExpandExporterMasterKeyFn>}
     */
    ExpandExporterMasterKey {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<SslEnumCipherSuitesExFn>}
     */
    EnumCipherSuitesEx {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<SslExpandResumptionMasterKeyFn>}
     */
    ExpandResumptionMasterKey {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<SslDuplicateTranscriptHashFn>}
     */
    DuplicateTranscriptHash {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Pointer<SslExpandBinderKeyFn>}
     */
    ExpandBinderKey {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {Pointer<SslExpandPreSharedKeyFn>}
     */
    ExpandPreSharedKey {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }
}
