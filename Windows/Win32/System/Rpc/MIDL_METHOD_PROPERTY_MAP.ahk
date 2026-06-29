#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDL_METHOD_PROPERTY.ahk" { MIDL_METHOD_PROPERTY }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_METHOD_PROPERTY_MAP {
    #StructPack 8

    Count : UInt32

    Properties : MIDL_METHOD_PROPERTY.Ptr

}
