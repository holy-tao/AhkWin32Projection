#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_LGPOS.ahk" { JET_LGPOS }
#Import ".\JET_LOGTIME.ahk" { JET_LOGTIME }
#Import ".\JET_RSTMAP_A.ahk" { JET_RSTMAP_A }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_RSTINFO_A {
    #StructPack 8

    cbStruct : UInt32

    rgrstmap : JET_RSTMAP_A.Ptr

    crstmap : Int32

    lgposStop : JET_LGPOS

    logtimeStop : JET_LOGTIME

    pfnStatus : IntPtr

}
