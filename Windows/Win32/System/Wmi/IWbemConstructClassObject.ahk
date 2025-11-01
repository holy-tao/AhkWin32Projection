#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemConstructClassObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemConstructClassObject
     * @type {Guid}
     */
    static IID => Guid("{9ef76194-70d5-11d1-ad90-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInheritanceChain", "SetPropertyOrigin", "SetMethodOrigin", "SetServerNamespace"]

    /**
     * 
     * @param {Integer} lNumAntecedents 
     * @param {Pointer} awszAntecedents 
     * @returns {HRESULT} 
     */
    SetInheritanceChain(lNumAntecedents, awszAntecedents) {
        result := ComCall(3, this, "int", lNumAntecedents, "ptr", awszAntecedents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPropertyName 
     * @param {Integer} lOriginIndex 
     * @returns {HRESULT} 
     */
    SetPropertyOrigin(wszPropertyName, lOriginIndex) {
        wszPropertyName := wszPropertyName is String ? StrPtr(wszPropertyName) : wszPropertyName

        result := ComCall(4, this, "ptr", wszPropertyName, "int", lOriginIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMethodName 
     * @param {Integer} lOriginIndex 
     * @returns {HRESULT} 
     */
    SetMethodOrigin(wszMethodName, lOriginIndex) {
        wszMethodName := wszMethodName is String ? StrPtr(wszMethodName) : wszMethodName

        result := ComCall(5, this, "ptr", wszMethodName, "int", lOriginIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszServer 
     * @param {PWSTR} wszNamespace 
     * @returns {HRESULT} 
     */
    SetServerNamespace(wszServer, wszNamespace) {
        wszServer := wszServer is String ? StrPtr(wszServer) : wszServer
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace

        result := ComCall(6, this, "ptr", wszServer, "ptr", wszNamespace, "HRESULT")
        return result
    }
}
