#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RANGECATEGORIZE.ahk" { RANGECATEGORIZE }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\BUCKETCATEGORIZE.ahk" { BUCKETCATEGORIZE }
#Import ".\COLUMNSET.ahk" { COLUMNSET }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct CATEGORIZATION {
    #StructPack 8

    ulCatType : UInt32

    cClusters : UInt32

    csColumns : COLUMNSET

    static __New() {
        DefineProp(this.Prototype, 'bucket', { type: BUCKETCATEGORIZE, offset: 8 })
        DefineProp(this.Prototype, 'range', { type: RANGECATEGORIZE, offset: 8 })
        this.DeleteProp("__New")
    }
}
