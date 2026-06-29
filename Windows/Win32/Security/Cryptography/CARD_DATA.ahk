#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_DATA {
    #StructPack 8

    dwVersion : UInt32

    pbAtr : IntPtr

    cbAtr : UInt32

    pwszCardName : PWSTR

    pfnCspAlloc : IntPtr

    pfnCspReAlloc : IntPtr

    pfnCspFree : IntPtr

    pfnCspCacheAddFile : IntPtr

    pfnCspCacheLookupFile : IntPtr

    pfnCspCacheDeleteFile : IntPtr

    pvCacheContext : IntPtr

    pfnCspPadData : IntPtr

    hSCardCtx : IntPtr

    hScard : IntPtr

    pvVendorSpecific : IntPtr

    pfnCardDeleteContext : IntPtr

    pfnCardQueryCapabilities : IntPtr

    pfnCardDeleteContainer : IntPtr

    pfnCardCreateContainer : IntPtr

    pfnCardGetContainerInfo : IntPtr

    pfnCardAuthenticatePin : IntPtr

    pfnCardGetChallenge : IntPtr

    pfnCardAuthenticateChallenge : IntPtr

    pfnCardUnblockPin : IntPtr

    pfnCardChangeAuthenticator : IntPtr

    pfnCardDeauthenticate : IntPtr

    pfnCardCreateDirectory : IntPtr

    pfnCardDeleteDirectory : IntPtr

    pvUnused3 : IntPtr

    pvUnused4 : IntPtr

    pfnCardCreateFile : IntPtr

    pfnCardReadFile : IntPtr

    pfnCardWriteFile : IntPtr

    pfnCardDeleteFile : IntPtr

    pfnCardEnumFiles : IntPtr

    pfnCardGetFileInfo : IntPtr

    pfnCardQueryFreeSpace : IntPtr

    pfnCardQueryKeySizes : IntPtr

    pfnCardSignData : IntPtr

    pfnCardRSADecrypt : IntPtr

    pfnCardConstructDHAgreement : IntPtr

    pfnCardDeriveKey : IntPtr

    pfnCardDestroyDHAgreement : IntPtr

    pfnCspGetDHAgreement : IntPtr

    pfnCardGetChallengeEx : IntPtr

    pfnCardAuthenticateEx : IntPtr

    pfnCardChangeAuthenticatorEx : IntPtr

    pfnCardDeauthenticateEx : IntPtr

    pfnCardGetContainerProperty : IntPtr

    pfnCardSetContainerProperty : IntPtr

    pfnCardGetProperty : IntPtr

    pfnCardSetProperty : IntPtr

    pfnCspUnpadData : IntPtr

    pfnMDImportSessionKey : IntPtr

    pfnMDEncryptData : IntPtr

    pfnCardImportSessionKey : IntPtr

    pfnCardGetSharedKeyHandle : IntPtr

    pfnCardGetAlgorithmProperty : IntPtr

    pfnCardGetKeyProperty : IntPtr

    pfnCardSetKeyProperty : IntPtr

    pfnCardDestroyKey : IntPtr

    pfnCardProcessEncryptedData : IntPtr

    pfnCardCreateContainerEx : IntPtr

}
