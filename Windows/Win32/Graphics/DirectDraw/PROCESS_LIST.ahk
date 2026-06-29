#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PROCESS_LIST {
    #StructPack 8

    lpLink : PROCESS_LIST.Ptr

    dwProcessId : UInt32

    dwRefCnt : UInt32

    dwAlphaDepth : UInt32

    dwZDepth : UInt32

}
