#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\Com\StructuredStorage\CABOOL.ahk" { CABOOL }
#Import "..\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import "..\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\Com\StructuredStorage\CAI.ahk" { CAI }
#Import "..\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import ".\CONTENTRESTRICTION.ahk" { CONTENTRESTRICTION }
#Import ".\NATLANGUAGERESTRICTION.ahk" { NATLANGUAGERESTRICTION }
#Import ".\NODERESTRICTION.ahk" { NODERESTRICTION }
#Import ".\NOTRESTRICTION.ahk" { NOTRESTRICTION }
#Import ".\PROPERTYRESTRICTION.ahk" { PROPERTYRESTRICTION }
#Import ".\VECTORRESTRICTION.ahk" { VECTORRESTRICTION }
#Import "..\Variant\VARENUM.ahk" { VARENUM }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct RESTRICTION {
    #StructPack 8


    struct _URes {
        ar : NODERESTRICTION

        static __New() {
            DefineProp(this.Prototype, 'orRestriction', { type: NODERESTRICTION, offset: 0 })
            DefineProp(this.Prototype, 'pxr', { type: NODERESTRICTION, offset: 0 })
            DefineProp(this.Prototype, 'vr', { type: VECTORRESTRICTION, offset: 0 })
            DefineProp(this.Prototype, 'nr', { type: NOTRESTRICTION, offset: 0 })
            DefineProp(this.Prototype, 'cr', { type: CONTENTRESTRICTION, offset: 0 })
            DefineProp(this.Prototype, 'nlr', { type: NATLANGUAGERESTRICTION, offset: 0 })
            DefineProp(this.Prototype, 'pr', { type: PROPERTYRESTRICTION, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    rt : UInt32

    weight : UInt32

    res : RESTRICTION._URes

}
