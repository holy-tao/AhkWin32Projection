#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWiaMiniDrvCallBack.ahk" { IWiaMiniDrvCallBack }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct MINIDRV_TRANSFER_CONTEXT {
    #StructPack 8

    lSize : Int32

    lWidthInPixels : Int32

    lLines : Int32

    lDepth : Int32

    lXRes : Int32

    lYRes : Int32

    lCompression : Int32

    guidFormatID : Guid

    tymed : Int32

    hFile : IntPtr

    cbOffset : Int32

    lBufferSize : Int32

    lActiveBuffer : Int32

    lNumBuffers : Int32

    pBaseBuffer : IntPtr

    pTransferBuffer : IntPtr

    bTransferDataCB : BOOL

    bClassDrvAllocBuf : BOOL

    lClientAddress : IntPtr

    pIWiaMiniDrvCallBack : IWiaMiniDrvCallBack

    lImageSize : Int32

    lHeaderSize : Int32

    lItemSize : Int32

    cbWidthInBytes : Int32

    lPage : Int32

    lCurIfdOffset : Int32

    lPrevIfdOffset : Int32

}
