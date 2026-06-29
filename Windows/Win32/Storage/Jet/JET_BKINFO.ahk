#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_LGPOS.ahk" { JET_LGPOS }
#Import ".\JET_LOGTIME.ahk" { JET_LOGTIME }
#Import ".\JET_BKLOGTIME.ahk" { JET_BKLOGTIME }

/**
 * Learn more about: JET_BKINFO structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-bkinfo-structure2
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_BKINFO {
    #StructPack 4

    lgposMark : JET_LGPOS

    logtimeMark : JET_LOGTIME

    genLow : UInt32

    genHigh : UInt32

    static __New() {
        DefineProp(this.Prototype, 'bklogtimeMark', { type: JET_BKLOGTIME, offset: 8 })
        this.DeleteProp("__New")
    }
}
