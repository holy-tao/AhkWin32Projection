#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_busobject_object_registration_ptr.ahk" { alljoyn_busobject_object_registration_ptr }
#Import ".\alljoyn_busobject_prop_get_ptr.ahk" { alljoyn_busobject_prop_get_ptr }
#Import ".\alljoyn_busobject_prop_set_ptr.ahk" { alljoyn_busobject_prop_set_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_busobject_callbacks {
    #StructPack 8

    property_get : alljoyn_busobject_prop_get_ptr

    property_set : alljoyn_busobject_prop_set_ptr

    object_registered : alljoyn_busobject_object_registration_ptr

    object_unregistered : alljoyn_busobject_object_registration_ptr

}
