#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR_USER_MARSHAL_INFO_LEVEL1.ahk

/**
 * The NDR_USER_MARSHAL_INFO structure holds information about the state of an RPC call that can be passed to wire_marshal and user_marshal helper functions.
 * @remarks
 * 
  * The function 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-ndrgetusermarshalinfo">NdrGetUserMarshalInfo</a> fills this structure with supplemental information for the 
  * <a href="https://docs.microsoft.com/windows/desktop/Midl/user-marshal">user_marshal</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/Midl/wire-marshal">wire_marshal</a> helper functions &lt;type&gt;_UserSize, &lt;type&gt;_UserMarshal, &lt;type&gt;_UserUnmarshal, and &lt;type&gt;_UserFree. This information supplements the <i>pFlags</i> parameter that is passed to these helper functions. Not all of these fields will contain valid information in all contexts. Level1.pRpcChannelBuffer is only valid for COM interfaces, and the buffer fields are only valid when 
  * <b>NdrGetUserMarshalInfo</b> is called from &lt;type&gt;_UserMarshal or &lt;type&gt;_UserUnmarshal.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rpcndr/ns-rpcndr-ndr_user_marshal_info
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR_USER_MARSHAL_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The information level of the returned data. Currently only a value of 1 is defined.
     * @type {Integer}
     */
    InformationLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {NDR_USER_MARSHAL_INFO_LEVEL1}
     */
    Level1{
        get {
            if(!this.HasProp("__Level1"))
                this.__Level1 := NDR_USER_MARSHAL_INFO_LEVEL1(this.ptr + 8)
            return this.__Level1
        }
    }
}
