#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_permissionconfigurationlistener_startmanagement_ptr.ahk" { alljoyn_permissionconfigurationlistener_startmanagement_ptr }
#Import ".\alljoyn_permissionconfigurationlistener_endmanagement_ptr.ahk" { alljoyn_permissionconfigurationlistener_endmanagement_ptr }
#Import ".\alljoyn_permissionconfigurationlistener_policychanged_ptr.ahk" { alljoyn_permissionconfigurationlistener_policychanged_ptr }
#Import ".\alljoyn_permissionconfigurationlistener_factoryreset_ptr.ahk" { alljoyn_permissionconfigurationlistener_factoryreset_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_permissionconfigurationlistener_callbacks {
    #StructPack 8

    factory_reset : alljoyn_permissionconfigurationlistener_factoryreset_ptr

    policy_changed : alljoyn_permissionconfigurationlistener_policychanged_ptr

    start_management : alljoyn_permissionconfigurationlistener_startmanagement_ptr

    end_management : alljoyn_permissionconfigurationlistener_endmanagement_ptr

}
