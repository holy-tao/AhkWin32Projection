#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UNIDRV_PRIVATE_DEVMODE {
    #StructPack 2

    wReserved : UInt16[4]

    wSize : UInt16

}
