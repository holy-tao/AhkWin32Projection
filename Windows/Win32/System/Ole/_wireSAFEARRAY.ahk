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
#Import "..\Com\SAFEARRAYBOUND.ahk" { SAFEARRAYBOUND }
#Import ".\SAFEARR_DISPATCH.ahk" { SAFEARR_DISPATCH }
#Import ".\SAFEARR_BRECORD.ahk" { SAFEARR_BRECORD }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\HYPER_SIZEDARR.ahk" { HYPER_SIZEDARR }
#Import ".\SAFEARR_VARIANT.ahk" { SAFEARR_VARIANT }
#Import ".\SAFEARRAYUNION.ahk" { SAFEARRAYUNION }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct _wireSAFEARRAY {
    #StructPack 8

    cDims : UInt16

    fFeatures : UInt16

    cbElements : UInt32

    cLocks : UInt32

    uArrayStructs : SAFEARRAYUNION

    rgsabound : SAFEARRAYBOUND[1]

}
