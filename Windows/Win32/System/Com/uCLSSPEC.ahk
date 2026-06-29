#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct uCLSSPEC {
    #StructPack 8


    struct _tagged_union {

        struct _ByName {
            pPackageName : PWSTR

            PolicyId : Guid

        }

        struct _ByObjectId {
            ObjectId : Guid

            PolicyId : Guid

        }

        clsid : Guid

        static __New() {
            DefineProp(this.Prototype, 'pFileExt', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'pMimeType', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'pProgId', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'pFileName', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'ByName', { type: uCLSSPEC._tagged_union._ByName, offset: 0 })
            DefineProp(this.Prototype, 'ByObjectId', { type: uCLSSPEC._tagged_union._ByObjectId, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    tyspec : UInt32

    tagged_union : uCLSSPEC._tagged_union

}
