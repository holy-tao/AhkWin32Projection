#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_busobject_callbacks {
    #StructPack 8

    property_get : IntPtr

    property_set : IntPtr

    object_registered : IntPtr

    object_unregistered : IntPtr

}
