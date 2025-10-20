#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemAddressResolution extends IUnknown{
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
     * 
     * @param {PWSTR} wszNamespacePath 
     * @param {PWSTR} wszAddressType 
     * @param {Pointer<UInt32>} pdwAddressLength 
     * @param {Pointer<Byte>} pabBinaryAddress 
     * @returns {HRESULT} 
     */
    Resolve(wszNamespacePath, wszAddressType, pdwAddressLength, pabBinaryAddress) {
        wszNamespacePath := wszNamespacePath is String ? StrPtr(wszNamespacePath) : wszNamespacePath
        wszAddressType := wszAddressType is String ? StrPtr(wszAddressType) : wszAddressType

        result := ComCall(3, this, "ptr", wszNamespacePath, "ptr", wszAddressType, "uint*", pdwAddressLength, "char*", pabBinaryAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
