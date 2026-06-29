#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENUM_CATYPES.ahk" { ENUM_CATYPES }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CAINFO {
    #StructPack 4

    cbSize : UInt32 := this.Size

    CAType : ENUM_CATYPES

    cCASignatureCerts : UInt32

    cCAExchangeCerts : UInt32

    cExitModules : UInt32

    lPropIdMax : Int32

    lRoleSeparationEnabled : Int32

    cKRACertUsedCount : UInt32

    cKRACertCount : UInt32

    fAdvancedServer : UInt32

}
