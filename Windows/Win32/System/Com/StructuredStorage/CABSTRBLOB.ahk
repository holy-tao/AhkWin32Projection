#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BSTRBLOB.ahk" { BSTRBLOB }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CABSTRBLOB {
    #StructPack 8

    cElems : UInt32

    pElems : BSTRBLOB.Ptr

}
