#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAFEARR_HAVEIID.ahk" { SAFEARR_HAVEIID }
#Import "..\Com\WORD_SIZEDARR.ahk" { WORD_SIZEDARR }
#Import ".\SAFEARR_BSTR.ahk" { SAFEARR_BSTR }
#Import "..\Com\FLAGGED_WORD_BLOB.ahk" { FLAGGED_WORD_BLOB }
#Import ".\_wireBRECORD.ahk" { _wireBRECORD }
#Import "..\Com\BYTE_SIZEDARR.ahk" { BYTE_SIZEDARR }
#Import ".\SAFEARR_UNKNOWN.ahk" { SAFEARR_UNKNOWN }
#Import "..\Com\DWORD_SIZEDARR.ahk" { DWORD_SIZEDARR }
#Import ".\_wireVARIANT.ahk" { _wireVARIANT }
#Import ".\SAFEARR_DISPATCH.ahk" { SAFEARR_DISPATCH }
#Import ".\SAFEARR_BRECORD.ahk" { SAFEARR_BRECORD }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\HYPER_SIZEDARR.ahk" { HYPER_SIZEDARR }
#Import ".\SAFEARR_VARIANT.ahk" { SAFEARR_VARIANT }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SAFEARRAYUNION {
    #StructPack 8


    struct _u {
        BstrStr : SAFEARR_BSTR

        static __New() {
            DefineProp(this.Prototype, 'UnknownStr', { type: SAFEARR_UNKNOWN, offset: 0 })
            DefineProp(this.Prototype, 'DispatchStr', { type: SAFEARR_DISPATCH, offset: 0 })
            DefineProp(this.Prototype, 'VariantStr', { type: SAFEARR_VARIANT, offset: 0 })
            DefineProp(this.Prototype, 'RecordStr', { type: SAFEARR_BRECORD, offset: 0 })
            DefineProp(this.Prototype, 'HaveIidStr', { type: SAFEARR_HAVEIID, offset: 0 })
            DefineProp(this.Prototype, 'ByteStr', { type: BYTE_SIZEDARR, offset: 0 })
            DefineProp(this.Prototype, 'WordStr', { type: WORD_SIZEDARR, offset: 0 })
            DefineProp(this.Prototype, 'LongStr', { type: DWORD_SIZEDARR, offset: 0 })
            DefineProp(this.Prototype, 'HyperStr', { type: HYPER_SIZEDARR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    sfType : UInt32

    u : SAFEARRAYUNION._u

}
