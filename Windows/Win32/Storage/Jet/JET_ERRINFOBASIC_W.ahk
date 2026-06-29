#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_ERRCAT.ahk" { JET_ERRCAT }

/**
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_ERRINFOBASIC_W {
    #StructPack 4

    cbStruct : UInt32

    errValue : Int32

    errcatMostSpecific : JET_ERRCAT

    rgCategoricalHierarchy : Int8[8]

    lSourceLine : UInt32

    rgszSourceFile : UInt16[64]

}
