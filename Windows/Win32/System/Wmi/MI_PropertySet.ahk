#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_PropertySetFT.ahk" { MI_PropertySetFT }

/**
 * Implements a set of property names.
 * @remarks
 * It supports the building and interrogation of property sets. In general, clients  build property sets and providers interrogate them.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_propertyset
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_PropertySet {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_propertysetft">MI_PropertySetFT</a> function table.
     */
    ft : MI_PropertySetFT.Ptr

    /**
     * Reserved for internal use.
     */
    reserved : IntPtr[3]

}
