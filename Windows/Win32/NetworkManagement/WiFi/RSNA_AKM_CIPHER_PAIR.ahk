#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RSNA_AKM_SUITE.ahk" { RSNA_AKM_SUITE }
#Import ".\RSNA_CIPHER_SUITE.ahk" { RSNA_CIPHER_SUITE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct RSNA_AKM_CIPHER_PAIR {
    #StructPack 4

    akm : RSNA_AKM_SUITE

    cipher : RSNA_CIPHER_SUITE

}
