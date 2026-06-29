#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_LOGTIME.ahk" { JET_LOGTIME }

/**
 * Learn more about: JET_SIGNATURE Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-signature-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_SIGNATURE {
    #StructPack 4

    ulRandom : UInt32

    logtimeCreate : JET_LOGTIME

    szComputerName : Int8[16]

}
