#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEINFO {
    #StructPack 4

    dwPrivateDataSize : UInt32

    fdwProperty : UInt32

    fdwConversionCaps : UInt32

    fdwSentenceCaps : UInt32

    fdwUICaps : UInt32

    fdwSCSCaps : UInt32

    fdwSelectCaps : UInt32

}
