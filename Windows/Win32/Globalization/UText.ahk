#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UTextFuncs.ahk" { UTextFuncs }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UText {
    #StructPack 8

    magic : UInt32

    flags : Int32

    providerProperties : Int32

    sizeOfStruct : Int32

    chunkNativeLimit : Int64

    extraSize : Int32

    nativeIndexingLimit : Int32

    chunkNativeStart : Int64

    chunkOffset : Int32

    chunkLength : Int32

    chunkContents : IntPtr

    pFuncs : UTextFuncs.Ptr

    pExtra : IntPtr

    context : IntPtr

    p : IntPtr

    q : IntPtr

    r : IntPtr

    privP : IntPtr

    a : Int64

    b : Int32

    c : Int32

    privA : Int64

    privB : Int32

    privC : Int32

}
