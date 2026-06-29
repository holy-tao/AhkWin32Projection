#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PALOBJ structure is a user object that represents an indexed color palette.
 * @remarks
 * This structure is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-palobj_cgetcolors">PALOBJ_cGetColors</a> service routine.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-palobj
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PALOBJ {
    #StructPack 4

    ulReserved : UInt32

}
