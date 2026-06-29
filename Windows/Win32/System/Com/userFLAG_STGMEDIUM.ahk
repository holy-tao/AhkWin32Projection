#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\SystemServices\userHGLOBAL.ahk" { userHGLOBAL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\SystemServices\userHMETAFILEPICT.ahk" { userHMETAFILEPICT }
#Import "..\SystemServices\userHENHMETAFILE.ahk" { userHENHMETAFILE }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\GDI_OBJECT.ahk" { GDI_OBJECT }
#Import ".\BYTE_BLOB.ahk" { BYTE_BLOB }
#Import ".\userSTGMEDIUM.ahk" { userSTGMEDIUM }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct userFLAG_STGMEDIUM {
    #StructPack 8

    ContextFlags : Int32

    fPassOwnership : Int32

    Stgmed : userSTGMEDIUM

}
