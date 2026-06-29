#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct COLUMNSET {
    #StructPack 8

    cCol : UInt32

    aCol : FULLPROPSPEC.Ptr

}
