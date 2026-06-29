#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\userHMETAFILE.ahk" { userHMETAFILE }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct remoteMETAFILEPICT {
    #StructPack 8

    mm : Int32

    xExt : Int32

    yExt : Int32

    hMF : userHMETAFILE.Ptr

}
