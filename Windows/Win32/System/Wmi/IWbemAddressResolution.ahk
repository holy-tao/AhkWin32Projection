#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemAddressResolution extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemAddressResolution
     * @type {Guid}
     */
    static IID => Guid("{f7ce2e12-8c90-11d1-9e7b-00c04fc324a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resolve"]

    /**
     * 
     * @param {PWSTR} wszNamespacePath 
     * @param {PWSTR} wszAddressType 
     * @param {Pointer<Integer>} pdwAddressLength 
     * @param {Pointer<Pointer<Integer>>} pabBinaryAddress 
     * @returns {HRESULT} 
     */
    Resolve(wszNamespacePath, wszAddressType, pdwAddressLength, pabBinaryAddress) {
        wszNamespacePath := wszNamespacePath is String ? StrPtr(wszNamespacePath) : wszNamespacePath
        wszAddressType := wszAddressType is String ? StrPtr(wszAddressType) : wszAddressType

        result := ComCall(3, this, "ptr", wszNamespacePath, "ptr", wszAddressType, "uint*", pdwAddressLength, "ptr*", pabBinaryAddress, "HRESULT")
        return result
    }
}
