#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct USER_MARSHAL_ROUTINE_QUADRUPLE {
    #StructPack 8

    pfnBufferSize : IntPtr

    pfnMarshall : IntPtr

    pfnUnmarshall : IntPtr

    pfnFree : IntPtr

}
