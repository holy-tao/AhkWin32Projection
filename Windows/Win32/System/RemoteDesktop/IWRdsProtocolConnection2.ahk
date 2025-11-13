#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWRdsProtocolConnection.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolConnection2 extends IWRdsProtocolConnection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolConnection2
     * @type {Guid}
     */
    static IID => Guid("{c2bd9b66-4a76-4701-b6a3-bfafc1482169}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSerializedUserCredential"]

    /**
     * 
     * @returns {Pointer<WTS_SERIALIZED_USER_CREDENTIAL>} 
     */
    GetSerializedUserCredential() {
        result := ComCall(27, this, "ptr*", &userCredential := 0, "HRESULT")
        return userCredential
    }
}
