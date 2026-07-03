#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RPC_HTTP_REDIRECTOR_STAGE.ahk" { RPC_HTTP_REDIRECTOR_STAGE }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_NEW_HTTP_PROXY_CHANNEL {
    value : IntPtr

    __value {
        set {
            if (value is RPC_NEW_HTTP_PROXY_CHANNEL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {RPC_HTTP_REDIRECTOR_STAGE} RedirectorStage 
     * @param {PWSTR} ServerName 
     * @param {PWSTR} ServerPort 
     * @param {PWSTR} RemoteUser 
     * @param {PWSTR} AuthType 
     * @param {Pointer<Void>} ResourceUuid 
     * @param {Pointer<Void>} SessionId 
     * @param {Pointer<Void>} _Interface 
     * @param {Pointer<Void>} Reserved 
     * @param {Integer} Flags 
     * @param {Pointer<PWSTR>} NewServerName 
     * @param {Pointer<PWSTR>} NewServerPort 
     * @returns {RPC_STATUS} 
     */
    Call(RedirectorStage, ServerName, ServerPort, RemoteUser, AuthType, ResourceUuid, SessionId, _Interface, Reserved, Flags, NewServerName, NewServerPort) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ServerPort := ServerPort is String ? StrPtr(ServerPort) : ServerPort
        RemoteUser := RemoteUser is String ? StrPtr(RemoteUser) : RemoteUser
        AuthType := AuthType is String ? StrPtr(AuthType) : AuthType

        ResourceUuidMarshal := ResourceUuid is VarRef ? "ptr" : "ptr"
        SessionIdMarshal := SessionId is VarRef ? "ptr" : "ptr"
        _InterfaceMarshal := _Interface is VarRef ? "ptr" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        NewServerNameMarshal := NewServerName is VarRef ? "ptr*" : "ptr"
        NewServerPortMarshal := NewServerPort is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, RPC_HTTP_REDIRECTOR_STAGE, RedirectorStage, "ptr", ServerName, "ptr", ServerPort, "ptr", RemoteUser, "ptr", AuthType, ResourceUuidMarshal, ResourceUuid, SessionIdMarshal, SessionId, _InterfaceMarshal, _Interface, ReservedMarshal, Reserved, UInt32, Flags, NewServerNameMarshal, NewServerName, NewServerPortMarshal, NewServerPort, RPC_STATUS)
        return result
    }

    /**
     * A RPC_NEW_HTTP_PROXY_CHANNEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_NEW_HTTP_PROXY_CHANNEL {
        /**
         * Creates a RPC_NEW_HTTP_PROXY_CHANNEL pointer that invokes the given AHK function when called.
         * @param {Func(RPC_HTTP_REDIRECTOR_STAGE, PWSTR, PWSTR, PWSTR, PWSTR, "ptr", "ptr", "ptr", "ptr", UInt32, PWSTR, PWSTR) => RPC_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 12)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 12 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RPC_HTTP_REDIRECTOR_STAGE, PWSTR, PWSTR, PWSTR, PWSTR, "ptr", "ptr", "ptr", "ptr", UInt32, PWSTR.Ptr, PWSTR.Ptr, RPC_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
