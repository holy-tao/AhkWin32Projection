#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_LOGTIME.ahk" { JET_LOGTIME }
#Import ".\JET_SIGNATURE.ahk" { JET_SIGNATURE }

/**
 * Learn more about: JET_COMMIT_ID class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-commit-id-class
 * @namespace Windows.Win32.Storage.Jet
 * @architecture X64, Arm64
 */
export default struct JET_COMMIT_ID {
    #StructPack 8

    signLog : JET_SIGNATURE

    reserved : Int32

    commitId : Int64

}
