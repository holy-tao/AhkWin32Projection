#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_NEW_HTTP_PROXY_CHANNEL extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} RedirectorStage 
     * @param {PWSTR} ServerName 
     * @param {PWSTR} ServerPort 
     * @param {PWSTR} RemoteUser 
     * @param {PWSTR} AuthType 
     * @param {Pointer<Void>} ResourceUuid 
     * @param {Pointer<Void>} SessionId 
     * @param {Pointer<Void>} Interface_ 
     * @param {Pointer<Void>} Reserved 
     * @param {Integer} Flags 
     * @param {Pointer<PWSTR>} NewServerName 
     * @param {Pointer<PWSTR>} NewServerPort 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(RedirectorStage, ServerName, ServerPort, RemoteUser, AuthType, ResourceUuid, SessionId, Interface_, Reserved, Flags, NewServerName, NewServerPort) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        ServerPort := ServerPort is String ? StrPtr(ServerPort) : ServerPort
        RemoteUser := RemoteUser is String ? StrPtr(RemoteUser) : RemoteUser
        AuthType := AuthType is String ? StrPtr(AuthType) : AuthType

        ResourceUuidMarshal := ResourceUuid is VarRef ? "ptr" : "ptr"
        SessionIdMarshal := SessionId is VarRef ? "ptr" : "ptr"
        Interface_Marshal := Interface_ is VarRef ? "ptr" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        NewServerNameMarshal := NewServerName is VarRef ? "ptr*" : "ptr"
        NewServerPortMarshal := NewServerPort is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", RedirectorStage, "ptr", ServerName, "ptr", ServerPort, "ptr", RemoteUser, "ptr", AuthType, ResourceUuidMarshal, ResourceUuid, SessionIdMarshal, SessionId, Interface_Marshal, Interface_, ReservedMarshal, Reserved, "uint", Flags, NewServerNameMarshal, NewServerName, NewServerPortMarshal, NewServerPort, "int")
        return result
    }
}
