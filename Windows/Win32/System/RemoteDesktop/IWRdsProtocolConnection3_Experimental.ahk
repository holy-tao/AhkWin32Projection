#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\IWRdsProtocolConnection2.ahk
#Include .\WTS_SERIALIZED_USER_CREDENTIAL.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class IWRdsProtocolConnection3_Experimental extends IWRdsProtocolConnection2 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolConnection3_Experimental
     * @type {Guid}
     */
    static IID => Guid("{3aa87da3-f60b-4280-b385-f1cc22ad5d9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSerializedUserCredentialInteractively"]

    /**
     * @param {Pointer<Guid>} scenarioId 
     * @param {PWSTR} usernameHint 
     * @returns {Pointer<WTS_SERIALIZED_USER_CREDENTIAL>} 
     */
    GetSerializedUserCredentialInteractively(scenarioId, usernameHint) {
        usernameHint := usernameHint is String ? StrPtr(usernameHint) : usernameHint

        result := ComCall(28, this, "ptr", scenarioId, "ptr", usernameHint, "ptr*", &userCredential := 0, "HRESULT")
        return userCredential
    }
}
