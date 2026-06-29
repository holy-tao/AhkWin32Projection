#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that is used by the IViewObject::Draw method to optimize rendering of an inactive object by making more efficient use of the GDI.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvaspectinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct DVASPECTINFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     */
    cb : UInt32

    /**
     * A value taken from the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ne-ocidl-dvaspectinfoflag">DVASPECTINFOFLAG</a> enumeration.
     */
    dwFlags : UInt32

}
