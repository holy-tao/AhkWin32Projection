#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\SystemServices\userHGLOBAL.ahk" { userHGLOBAL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\SystemServices\userHMETAFILEPICT.ahk" { userHMETAFILEPICT }
#Import "..\SystemServices\userHENHMETAFILE.ahk" { userHENHMETAFILE }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\GDI_OBJECT.ahk" { GDI_OBJECT }
#Import ".\BYTE_BLOB.ahk" { BYTE_BLOB }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct userSTGMEDIUM {
    #StructPack 8


    struct _STGMEDIUM_UNION {

        struct _u {
            hMetaFilePict : userHMETAFILEPICT.Ptr

            static __New() {
                DefineProp(this.Prototype, 'hHEnhMetaFile', { type: userHENHMETAFILE.Ptr, offset: 0 })
                DefineProp(this.Prototype, 'hGdiHandle', { type: GDI_OBJECT.Ptr, offset: 0 })
                DefineProp(this.Prototype, 'hGlobal', { type: userHGLOBAL.Ptr, offset: 0 })
                DefineProp(this.Prototype, 'lpszFileName', { type: PWSTR, offset: 0 })
                DefineProp(this.Prototype, 'pstm', { type: BYTE_BLOB.Ptr, offset: 0 })
                DefineProp(this.Prototype, 'pstg', { type: BYTE_BLOB.Ptr, offset: 0 })
                this.DeleteProp("__New")
            }
        }

        tymed : UInt32

        u : userSTGMEDIUM._STGMEDIUM_UNION._u

    }

    u : userSTGMEDIUM._STGMEDIUM_UNION

    pUnkForRelease : IUnknown

}
