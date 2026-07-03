#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UTextAccess.ahk" { UTextAccess }
#Import ".\UTextClone.ahk" { UTextClone }
#Import ".\UTextClose.ahk" { UTextClose }
#Import ".\UTextCopy.ahk" { UTextCopy }
#Import ".\UTextExtract.ahk" { UTextExtract }
#Import ".\UTextMapNativeIndexToUTF16.ahk" { UTextMapNativeIndexToUTF16 }
#Import ".\UTextMapOffsetToNative.ahk" { UTextMapOffsetToNative }
#Import ".\UTextNativeLength.ahk" { UTextNativeLength }
#Import ".\UTextReplace.ahk" { UTextReplace }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextFuncs {
    #StructPack 8

    tableSize : Int32

    reserved1 : Int32

    reserved2 : Int32

    reserved3 : Int32

    clone : UTextClone

    nativeLength : UTextNativeLength

    access : UTextAccess

    extract : UTextExtract

    replace : UTextReplace

    copy : UTextCopy

    mapOffsetToNative : UTextMapOffsetToNative

    mapNativeIndexToUTF16 : UTextMapNativeIndexToUTF16

    close : UTextClose

    spare1 : UTextClose

    spare2 : UTextClose

    spare3 : UTextClose

}
