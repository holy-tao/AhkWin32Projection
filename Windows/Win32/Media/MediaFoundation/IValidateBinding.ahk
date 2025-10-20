#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IValidateBinding extends IUnknown{
    /**
     * The interface identifier for IValidateBinding
     * @type {Guid}
     */
    static IID => Guid("{04a578b2-e778-422a-a805-b3ee54d90bd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidLicensorID 
     * @param {Pointer<Byte>} pbEphemeron 
     * @param {Integer} cbEphemeron 
     * @param {Pointer<Byte>} ppbBlobValidationID 
     * @param {Pointer<UInt32>} pcbBlobSize 
     * @returns {HRESULT} 
     */
    GetIdentifier(guidLicensorID, pbEphemeron, cbEphemeron, ppbBlobValidationID, pcbBlobSize) {
        result := ComCall(3, this, "ptr", guidLicensorID, "char*", pbEphemeron, "uint", cbEphemeron, "char*", ppbBlobValidationID, "uint*", pcbBlobSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
