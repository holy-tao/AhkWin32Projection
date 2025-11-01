#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IValidateBinding extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentifier"]

    /**
     * 
     * @param {Guid} guidLicensorID 
     * @param {Pointer<Integer>} pbEphemeron 
     * @param {Integer} cbEphemeron 
     * @param {Pointer<Pointer<Integer>>} ppbBlobValidationID 
     * @param {Pointer<Integer>} pcbBlobSize 
     * @returns {HRESULT} 
     */
    GetIdentifier(guidLicensorID, pbEphemeron, cbEphemeron, ppbBlobValidationID, pcbBlobSize) {
        pbEphemeronMarshal := pbEphemeron is VarRef ? "char*" : "ptr"
        pcbBlobSizeMarshal := pcbBlobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", guidLicensorID, pbEphemeronMarshal, pbEphemeron, "uint", cbEphemeron, "ptr*", ppbBlobValidationID, pcbBlobSizeMarshal, pcbBlobSize, "HRESULT")
        return result
    }
}
