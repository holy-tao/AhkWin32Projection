#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_keystorelistener_releaseexclusivelock_ptr.ahk" { alljoyn_keystorelistener_releaseexclusivelock_ptr }
#Import ".\alljoyn_keystorelistener_loadrequest_ptr.ahk" { alljoyn_keystorelistener_loadrequest_ptr }
#Import ".\alljoyn_keystorelistener_storerequest_ptr.ahk" { alljoyn_keystorelistener_storerequest_ptr }
#Import ".\alljoyn_keystorelistener_acquireexclusivelock_ptr.ahk" { alljoyn_keystorelistener_acquireexclusivelock_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_keystorelistener_with_synchronization_callbacks {
    #StructPack 8

    load_request : alljoyn_keystorelistener_loadrequest_ptr

    store_request : alljoyn_keystorelistener_storerequest_ptr

    acquire_exclusive_lock : alljoyn_keystorelistener_acquireexclusivelock_ptr

    release_exclusive_lock : alljoyn_keystorelistener_releaseexclusivelock_ptr

}
