#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OLESTREAMVTBL.ahk" { OLESTREAMVTBL }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct OLESTREAM {
    #StructPack 8

    lpstbl : OLESTREAMVTBL.Ptr

}
