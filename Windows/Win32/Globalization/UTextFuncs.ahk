#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UTextClone.ahk" { UTextClone }
#Import ".\UTextExtract.ahk" { UTextExtract }
#Import ".\UTextNativeLength.ahk" { UTextNativeLength }
#Import ".\UTextMapNativeIndexToUTF16.ahk" { UTextMapNativeIndexToUTF16 }
#Import ".\UTextClose.ahk" { UTextClose }
#Import ".\UTextAccess.ahk" { UTextAccess }
#Import ".\UTextCopy.ahk" { UTextCopy }
#Import ".\UTextReplace.ahk" { UTextReplace }
#Import ".\UTextMapOffsetToNative.ahk" { UTextMapOffsetToNative }

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
