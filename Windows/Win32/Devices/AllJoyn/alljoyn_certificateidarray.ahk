#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_certificateid.ahk" { alljoyn_certificateid }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_certificateidarray {
    #StructPack 8

    count : IntPtr

    ids : alljoyn_certificateid.Ptr

}
