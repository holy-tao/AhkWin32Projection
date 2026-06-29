#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_LOGTIME.ahk" { JET_LOGTIME }
#Import ".\JET_BKLOGTIME.ahk" { JET_BKLOGTIME }
#Import ".\JET_SIGNATURE.ahk" { JET_SIGNATURE }
#Import ".\JET_BKINFO.ahk" { JET_BKINFO }
#Import ".\JET_LGPOS.ahk" { JET_LGPOS }

/**
 * Learn more about: JET_DBINFOMISC constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-dbinfomisc-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_DBINFOMISC {
    #StructPack 4

    ulVersion : UInt32

    ulUpdate : UInt32

    signDb : JET_SIGNATURE

    dbstate : UInt32

    lgposConsistent : JET_LGPOS

    logtimeConsistent : JET_LOGTIME

    logtimeAttach : JET_LOGTIME

    lgposAttach : JET_LGPOS

    logtimeDetach : JET_LOGTIME

    lgposDetach : JET_LGPOS

    signLog : JET_SIGNATURE

    bkinfoFullPrev : JET_BKINFO

    bkinfoIncPrev : JET_BKINFO

    bkinfoFullCur : JET_BKINFO

    fShadowingDisabled : UInt32

    fUpgradeDb : UInt32

    dwMajorVersion : UInt32

    dwMinorVersion : UInt32

    dwBuildNumber : UInt32

    lSPNumber : Int32

    cbPageSize : UInt32

}
