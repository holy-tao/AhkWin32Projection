#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NODERESTRICTION.ahk" { NODERESTRICTION }
#Import "..\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }
#Import ".\PROPERTYRESTRICTION.ahk" { PROPERTYRESTRICTION }
#Import "..\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import "..\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\StructuredStorage\CABOOL.ahk" { CABOOL }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import ".\NATLANGUAGERESTRICTION.ahk" { NATLANGUAGERESTRICTION }
#Import "..\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\StructuredStorage\CAI.ahk" { CAI }
#Import "..\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\VECTORRESTRICTION.ahk" { VECTORRESTRICTION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import ".\NOTRESTRICTION.ahk" { NOTRESTRICTION }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import "..\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import ".\CONTENTRESTRICTION.ahk" { CONTENTRESTRICTION }

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
