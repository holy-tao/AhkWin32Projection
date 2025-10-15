#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The NOTIFYCANCEL structure contains the details of a network disconnect operation. It is used by the CancelConnectNotify function.
 * @see https://docs.microsoft.com/windows/win32/api//npapi/ns-npapi-notifycancel
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
    lpName{
        get {
            if(!this.HasProp("__lpName"))
                this.__lpName := PWSTR(this.ptr + 0)
            return this.__lpName
        }
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
    lpProvider{
        get {
            if(!this.HasProp("__lpProvider"))
                this.__lpProvider := PWSTR(this.ptr + 8)
            return this.__lpProvider
        }
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
    fForce{
        get {
            if(!this.HasProp("__fForce"))
                this.__fForce := BOOL(this.ptr + 20)
            return this.__fForce
        }
    }
}
