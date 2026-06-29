#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QCMINFO_IDMAP_PLACEMENT.ahk" { QCMINFO_IDMAP_PLACEMENT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct QCMINFO_IDMAP {
    #StructPack 4

    nMaxIds : UInt32

    pIdList : QCMINFO_IDMAP_PLACEMENT[1]

}
