#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_LGPOS.ahk" { JET_LGPOS }
#Import ".\JET_LOGTIME.ahk" { JET_LOGTIME }
#Import ".\JET_RSTMAP_W.ahk" { JET_RSTMAP_W }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_RSTINFO_W {
    #StructPack 8

    cbStruct : UInt32

    rgrstmap : JET_RSTMAP_W.Ptr

    crstmap : Int32

    lgposStop : JET_LGPOS

    logtimeStop : JET_LOGTIME

    pfnStatus : IntPtr

}
