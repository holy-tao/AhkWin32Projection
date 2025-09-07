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
                this.__Version := BCRYPT_INTERFACE_VERSION(this.ptr + 0)
            return this.__Version
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ComputeClientAuthHash {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ComputeEapKeyBlock {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ComputeFinishedHash {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    CreateEphemeralKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    CreateHandshakeHash {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    DecryptPacket {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    EncryptPacket {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    EnumCipherSuites {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExportKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    FreeBuffer {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    FreeObject {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GenerateMasterKey {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GenerateSessionKeys {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GetKeyProperty {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GetProviderProperty {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    HashHandshake {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ImportMasterKey {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ImportKey {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    LookupCipherSuiteInfo {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    OpenPrivateKey {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    OpenProvider {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SignHash {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    VerifySignature {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    LookupCipherLengths {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    CreateClientAuthHash {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GetCipherSuitePRFHashAlgorithm {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ComputeSessionHash {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GeneratePreMasterKey {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    EnumEccCurves {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExportKeyingMaterial {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExtractEarlyKey {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExtractHandshakeKey {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExtractMasterKey {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExpandTrafficKeys {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExpandWriteKey {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExpandExporterMasterKey {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    EnumCipherSuitesEx {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExpandResumptionMasterKey {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    DuplicateTranscriptHash {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExpandBinderKey {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ExpandPreSharedKey {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }
}
