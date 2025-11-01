#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CARD_DATA extends Win32Struct
{
    static sizeof => 504

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbAtr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbAtr {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pwszCardName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFN_CSP_ALLOC>}
     */
    pfnCspAlloc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFN_CSP_REALLOC>}
     */
    pfnCspReAlloc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFN_CSP_FREE>}
     */
    pfnCspFree {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFN_CSP_CACHE_ADD_FILE>}
     */
    pfnCspCacheAddFile {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFN_CSP_CACHE_LOOKUP_FILE>}
     */
    pfnCspCacheLookupFile {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PFN_CSP_CACHE_DELETE_FILE>}
     */
    pfnCspCacheDeleteFile {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvCacheContext {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PFN_CSP_PAD_DATA>}
     */
    pfnCspPadData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    hSCardCtx {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    hScard {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvVendorSpecific {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PFN_CARD_DELETE_CONTEXT>}
     */
    pfnCardDeleteContext {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PFN_CARD_QUERY_CAPABILITIES>}
     */
    pfnCardQueryCapabilities {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<PFN_CARD_DELETE_CONTAINER>}
     */
    pfnCardDeleteContainer {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<PFN_CARD_CREATE_CONTAINER>}
     */
    pfnCardCreateContainer {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_CONTAINER_INFO>}
     */
    pfnCardGetContainerInfo {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<PFN_CARD_AUTHENTICATE_PIN>}
     */
    pfnCardAuthenticatePin {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_CHALLENGE>}
     */
    pfnCardGetChallenge {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<PFN_CARD_AUTHENTICATE_CHALLENGE>}
     */
    pfnCardAuthenticateChallenge {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<PFN_CARD_UNBLOCK_PIN>}
     */
    pfnCardUnblockPin {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<PFN_CARD_CHANGE_AUTHENTICATOR>}
     */
    pfnCardChangeAuthenticator {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<PFN_CARD_DEAUTHENTICATE>}
     */
    pfnCardDeauthenticate {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<PFN_CARD_CREATE_DIRECTORY>}
     */
    pfnCardCreateDirectory {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<PFN_CARD_DELETE_DIRECTORY>}
     */
    pfnCardDeleteDirectory {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvUnused3 {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvUnused4 {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<PFN_CARD_CREATE_FILE>}
     */
    pfnCardCreateFile {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<PFN_CARD_READ_FILE>}
     */
    pfnCardReadFile {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<PFN_CARD_WRITE_FILE>}
     */
    pfnCardWriteFile {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<PFN_CARD_DELETE_FILE>}
     */
    pfnCardDeleteFile {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<PFN_CARD_ENUM_FILES>}
     */
    pfnCardEnumFiles {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_FILE_INFO>}
     */
    pfnCardGetFileInfo {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<PFN_CARD_QUERY_FREE_SPACE>}
     */
    pfnCardQueryFreeSpace {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<PFN_CARD_QUERY_KEY_SIZES>}
     */
    pfnCardQueryKeySizes {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<PFN_CARD_SIGN_DATA>}
     */
    pfnCardSignData {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<PFN_CARD_RSA_DECRYPT>}
     */
    pfnCardRSADecrypt {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Pointer<PFN_CARD_CONSTRUCT_DH_AGREEMENT>}
     */
    pfnCardConstructDHAgreement {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {Pointer<PFN_CARD_DERIVE_KEY>}
     */
    pfnCardDeriveKey {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * @type {Pointer<PFN_CARD_DESTROY_DH_AGREEMENT>}
     */
    pfnCardDestroyDHAgreement {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * @type {Pointer<PFN_CSP_GET_DH_AGREEMENT>}
     */
    pfnCspGetDHAgreement {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_CHALLENGE_EX>}
     */
    pfnCardGetChallengeEx {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {Pointer<PFN_CARD_AUTHENTICATE_EX>}
     */
    pfnCardAuthenticateEx {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Pointer<PFN_CARD_CHANGE_AUTHENTICATOR_EX>}
     */
    pfnCardChangeAuthenticatorEx {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * @type {Pointer<PFN_CARD_DEAUTHENTICATE_EX>}
     */
    pfnCardDeauthenticateEx {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_CONTAINER_PROPERTY>}
     */
    pfnCardGetContainerProperty {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * @type {Pointer<PFN_CARD_SET_CONTAINER_PROPERTY>}
     */
    pfnCardSetContainerProperty {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_PROPERTY>}
     */
    pfnCardGetProperty {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {Pointer<PFN_CARD_SET_PROPERTY>}
     */
    pfnCardSetProperty {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Pointer<PFN_CSP_UNPAD_DATA>}
     */
    pfnCspUnpadData {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Pointer<PFN_MD_IMPORT_SESSION_KEY>}
     */
    pfnMDImportSessionKey {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }

    /**
     * @type {Pointer<PFN_MD_ENCRYPT_DATA>}
     */
    pfnMDEncryptData {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * @type {Pointer<PFN_CARD_IMPORT_SESSION_KEY>}
     */
    pfnCardImportSessionKey {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_SHARED_KEY_HANDLE>}
     */
    pfnCardGetSharedKeyHandle {
        get => NumGet(this, 448, "ptr")
        set => NumPut("ptr", value, this, 448)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_ALGORITHM_PROPERTY>}
     */
    pfnCardGetAlgorithmProperty {
        get => NumGet(this, 456, "ptr")
        set => NumPut("ptr", value, this, 456)
    }

    /**
     * @type {Pointer<PFN_CARD_GET_KEY_PROPERTY>}
     */
    pfnCardGetKeyProperty {
        get => NumGet(this, 464, "ptr")
        set => NumPut("ptr", value, this, 464)
    }

    /**
     * @type {Pointer<PFN_CARD_SET_KEY_PROPERTY>}
     */
    pfnCardSetKeyProperty {
        get => NumGet(this, 472, "ptr")
        set => NumPut("ptr", value, this, 472)
    }

    /**
     * @type {Pointer<PFN_CARD_DESTROY_KEY>}
     */
    pfnCardDestroyKey {
        get => NumGet(this, 480, "ptr")
        set => NumPut("ptr", value, this, 480)
    }

    /**
     * @type {Pointer<PFN_CARD_PROCESS_ENCRYPTED_DATA>}
     */
    pfnCardProcessEncryptedData {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * @type {Pointer<PFN_CARD_CREATE_CONTAINER_EX>}
     */
    pfnCardCreateContainerEx {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }
}
