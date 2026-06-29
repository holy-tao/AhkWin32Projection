#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The NOTIFYCANCEL structure contains the details of a network disconnect operation. It is used by the CancelConnectNotify function.
 * @see https://learn.microsoft.com/windows/win32/api/npapi/ns-npapi-notifycancel
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NOTIFYCANCEL {
    #StructPack 8

    /**
     * Pointer to the name of the local device or network resource whose connection is being canceled.
     */
    lpName : PWSTR

    /**
     * For advance notification, this field is not defined. The MPR will try all valid providers to cancel the connection. 
     * 
     * 
     * 
     * 
     * For after-the-fact notification, if the cancel operation was successful, this field specifies the name of the network provider that canceled the connection.
     */
    lpProvider : PWSTR

    /**
     * Currently, the only flag supported is CONNECT_UPDATE_PROFILE, which indicates whether the disconnection should remain persistent. If this flag is set, Windows no longer restores this connection when the user logs on.
     */
    dwFlags : UInt32

    /**
     * Indicates whether the disconnect should continue even if there are open files or jobs on the connection. If this field is <b>TRUE</b>, the connection is canceled regardless of open files or jobs. If this field is <b>FALSE</b>, the connection will not be canceled if there are open files or jobs.
     */
    fForce : BOOL

}
