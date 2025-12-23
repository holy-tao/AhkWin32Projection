#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NOTIFYCANCEL structure contains the details of a network disconnect operation. It is used by the CancelConnectNotify function.
 * @see https://learn.microsoft.com/windows/win32/api/npapi/ns-npapi-notifycancel
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NOTIFYCANCEL extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to the name of the local device or network resource whose connection is being canceled.
     * @type {PWSTR}
     */
    lpName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * For advance notification, this field is not defined. The MPR will try all valid providers to cancel the connection. 
     * 
     * 
     * 
     * 
     * For after-the-fact notification, if the cancel operation was successful, this field specifies the name of the network provider that canceled the connection.
     * @type {PWSTR}
     */
    lpProvider {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Currently, the only flag supported is CONNECT_UPDATE_PROFILE, which indicates whether the disconnection should remain persistent. If this flag is set, Windows no longer restores this connection when the user logs on.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates whether the disconnect should continue even if there are open files or jobs on the connection. If this field is <b>TRUE</b>, the connection is canceled regardless of open files or jobs. If this field is <b>FALSE</b>, the connection will not be canceled if there are open files or jobs.
     * @type {BOOL}
     */
    fForce {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
