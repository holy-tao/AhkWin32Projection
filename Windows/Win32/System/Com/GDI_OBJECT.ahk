#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\SystemServices\userHBITMAP.ahk" { userHBITMAP }
#Import "..\SystemServices\userHGLOBAL.ahk" { userHGLOBAL }
#Import "..\SystemServices\userHPALETTE.ahk" { userHPALETTE }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct GDI_OBJECT {
    #StructPack 8


    struct _u {
        hBitmap : userHBITMAP.Ptr

        static __New() {
            DefineProp(this.Prototype, 'hPalette', { type: userHPALETTE.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'hGeneric', { type: userHGLOBAL.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ObjectType : UInt32

    u : GDI_OBJECT._u

}
