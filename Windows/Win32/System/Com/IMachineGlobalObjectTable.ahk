#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMachineGlobalObjectTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMachineGlobalObjectTable
     * @type {Guid}
     */
    static IID => Guid("{26d709ac-f70b-4421-a96f-d2878fafb00d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterObject", "GetObject", "RevokeObject"]

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} identifier 
     * @param {IUnknown} object 
     * @param {Pointer<MachineGlobalObjectTableRegistrationToken>} token 
     * @returns {HRESULT} 
     */
    RegisterObject(clsid, identifier, object, token) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(3, this, "ptr", clsid, "ptr", identifier, "ptr", object, "ptr", token, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} identifier 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(clsid, identifier, riid, ppv) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(4, this, "ptr", clsid, "ptr", identifier, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MachineGlobalObjectTableRegistrationToken} token 
     * @returns {HRESULT} 
     */
    RevokeObject(token) {
        result := ComCall(5, this, "ptr", token, "HRESULT")
        return result
    }
}
