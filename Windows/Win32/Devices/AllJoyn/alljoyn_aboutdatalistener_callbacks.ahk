#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_aboutdatalistener_getaboutdata_ptr.ahk" { alljoyn_aboutdatalistener_getaboutdata_ptr }
#Import ".\alljoyn_aboutdatalistener_getannouncedaboutdata_ptr.ahk" { alljoyn_aboutdatalistener_getannouncedaboutdata_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_aboutdatalistener_callbacks {
    #StructPack 8

    about_datalistener_getaboutdata : alljoyn_aboutdatalistener_getaboutdata_ptr

    about_datalistener_getannouncedaboutdata : alljoyn_aboutdatalistener_getannouncedaboutdata_ptr

}
