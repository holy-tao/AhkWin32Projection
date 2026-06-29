#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_WMDRMTUNER_PIDPROTECTION {
    #StructPack 4

    lResult : Int32

    uuidKeyID : Guid

}
