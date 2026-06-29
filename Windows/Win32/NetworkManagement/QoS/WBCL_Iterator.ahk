#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct WBCL_Iterator {
    #StructPack 8

    firstElementPtr : IntPtr

    logSize : UInt32

    currentElementPtr : IntPtr

    currentElementSize : UInt32

    digestSize : UInt16

    logFormat : UInt16

    numberOfDigests : UInt32

    digestSizes : IntPtr

    supportedAlgorithms : UInt32

    hashAlgorithm : UInt16

}
