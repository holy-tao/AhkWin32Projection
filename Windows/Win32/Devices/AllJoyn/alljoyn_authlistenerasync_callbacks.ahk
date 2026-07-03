#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_authlistener_authenticationcomplete_ptr.ahk" { alljoyn_authlistener_authenticationcomplete_ptr }
#Import ".\alljoyn_authlistener_requestcredentialsasync_ptr.ahk" { alljoyn_authlistener_requestcredentialsasync_ptr }
#Import ".\alljoyn_authlistener_securityviolation_ptr.ahk" { alljoyn_authlistener_securityviolation_ptr }
#Import ".\alljoyn_authlistener_verifycredentialsasync_ptr.ahk" { alljoyn_authlistener_verifycredentialsasync_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistenerasync_callbacks {
    #StructPack 8

    request_credentials : alljoyn_authlistener_requestcredentialsasync_ptr

    verify_credentials : alljoyn_authlistener_verifycredentialsasync_ptr

    security_violation : alljoyn_authlistener_securityviolation_ptr

    authentication_complete : alljoyn_authlistener_authenticationcomplete_ptr

}
