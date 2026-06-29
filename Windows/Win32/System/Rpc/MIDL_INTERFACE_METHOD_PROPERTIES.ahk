#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDL_METHOD_PROPERTY_MAP.ahk" { MIDL_METHOD_PROPERTY_MAP }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_INTERFACE_METHOD_PROPERTIES {
    #StructPack 8

    MethodCount : UInt16

    MethodProperties : IntPtr

}
