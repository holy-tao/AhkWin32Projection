#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_authlistener_authenticationcomplete_ptr.ahk" { alljoyn_authlistener_authenticationcomplete_ptr }
#Import ".\alljoyn_authlistener_requestcredentials_ptr.ahk" { alljoyn_authlistener_requestcredentials_ptr }
#Import ".\alljoyn_authlistener_securityviolation_ptr.ahk" { alljoyn_authlistener_securityviolation_ptr }
#Import ".\alljoyn_authlistener_verifycredentials_ptr.ahk" { alljoyn_authlistener_verifycredentials_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistener_callbacks {
    #StructPack 8

    request_credentials : alljoyn_authlistener_requestcredentials_ptr

    verify_credentials : alljoyn_authlistener_verifycredentials_ptr

    security_violation : alljoyn_authlistener_securityviolation_ptr

    authentication_complete : alljoyn_authlistener_authenticationcomplete_ptr

}
