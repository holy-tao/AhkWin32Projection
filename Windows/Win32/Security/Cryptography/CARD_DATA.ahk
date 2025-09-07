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
     * @type {Pointer<Byte>}
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
     * @type {Pointer<Ptr>}
     */
    pwszCardName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspAlloc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspReAlloc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspFree {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspCacheAddFile {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspCacheLookupFile {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
     */
    pfnCardDeleteContext {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardQueryCapabilities {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDeleteContainer {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardCreateContainer {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetContainerInfo {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardAuthenticatePin {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetChallenge {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardAuthenticateChallenge {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardUnblockPin {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardChangeAuthenticator {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDeauthenticate {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardCreateDirectory {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
     */
    pfnCardCreateFile {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardReadFile {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardWriteFile {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDeleteFile {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardEnumFiles {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetFileInfo {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardQueryFreeSpace {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardQueryKeySizes {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardSignData {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardRSADecrypt {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardConstructDHAgreement {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDeriveKey {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDestroyDHAgreement {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspGetDHAgreement {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetChallengeEx {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardAuthenticateEx {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardChangeAuthenticatorEx {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDeauthenticateEx {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetContainerProperty {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardSetContainerProperty {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetProperty {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardSetProperty {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCspUnpadData {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnMDImportSessionKey {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnMDEncryptData {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardImportSessionKey {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetSharedKeyHandle {
        get => NumGet(this, 448, "ptr")
        set => NumPut("ptr", value, this, 448)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetAlgorithmProperty {
        get => NumGet(this, 456, "ptr")
        set => NumPut("ptr", value, this, 456)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardGetKeyProperty {
        get => NumGet(this, 464, "ptr")
        set => NumPut("ptr", value, this, 464)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardSetKeyProperty {
        get => NumGet(this, 472, "ptr")
        set => NumPut("ptr", value, this, 472)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardDestroyKey {
        get => NumGet(this, 480, "ptr")
        set => NumPut("ptr", value, this, 480)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardProcessEncryptedData {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCardCreateContainerEx {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }
}
