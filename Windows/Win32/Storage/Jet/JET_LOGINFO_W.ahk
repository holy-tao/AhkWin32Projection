#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_LOGINFO_W {
    #StructPack 4

    cbSize : UInt32 := this.Size

    ulGenLow : UInt32

    ulGenHigh : UInt32

    szBaseName : UInt16[4]

}
