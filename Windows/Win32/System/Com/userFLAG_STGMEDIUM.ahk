#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BYTE_BLOB.ahk" { BYTE_BLOB }
#Import ".\GDI_OBJECT.ahk" { GDI_OBJECT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\userSTGMEDIUM.ahk" { userSTGMEDIUM }
#Import "..\SystemServices\userHENHMETAFILE.ahk" { userHENHMETAFILE }
#Import "..\SystemServices\userHGLOBAL.ahk" { userHGLOBAL }
#Import "..\SystemServices\userHMETAFILEPICT.ahk" { userHMETAFILEPICT }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct userFLAG_STGMEDIUM {
    #StructPack 8

    ContextFlags : Int32

    fPassOwnership : Int32

    Stgmed : userSTGMEDIUM

}
