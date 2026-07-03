#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDL_STUB_MESSAGE.ahk" { MIDL_STUB_MESSAGE }
#Import ".\USER_MARSHAL_CB_TYPE.ahk" { USER_MARSHAL_CB_TYPE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct USER_MARSHAL_CB {
    #StructPack 8

    Flags : UInt32

    pStubMsg : MIDL_STUB_MESSAGE.Ptr

    pReserve : IntPtr

    Signature : UInt32

    CBType : USER_MARSHAL_CB_TYPE

    pFormat : IntPtr

    pTypeFormat : IntPtr

}
