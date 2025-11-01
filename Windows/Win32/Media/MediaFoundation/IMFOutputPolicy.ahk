#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Encapsulates a usage policy from an input trust authority (ITA).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfoutputpolicy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFOutputPolicy extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFOutputPolicy
     * @type {Guid}
     */
    static IID => Guid("{7f00f10a-daed-41af-ab26-5fdfa4dfba3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateRequiredSchemas", "GetOriginatorID", "GetMinimumGRLVersion"]

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Guid} guidOutputSubType 
     * @param {Pointer<Guid>} rgGuidProtectionSchemasSupported 
     * @param {Integer} cProtectionSchemasSupported 
     * @param {Pointer<IMFCollection>} ppRequiredProtectionSchemas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputpolicy-generaterequiredschemas
     */
    GenerateRequiredSchemas(dwAttributes, guidOutputSubType, rgGuidProtectionSchemasSupported, cProtectionSchemasSupported, ppRequiredProtectionSchemas) {
        result := ComCall(33, this, "uint", dwAttributes, "ptr", guidOutputSubType, "ptr", rgGuidProtectionSchemasSupported, "uint", cProtectionSchemasSupported, "ptr*", ppRequiredProtectionSchemas, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidOriginatorID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputpolicy-getoriginatorid
     */
    GetOriginatorID(pguidOriginatorID) {
        result := ComCall(34, this, "ptr", pguidOriginatorID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMinimumGRLVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputpolicy-getminimumgrlversion
     */
    GetMinimumGRLVersion(pdwMinimumGRLVersion) {
        pdwMinimumGRLVersionMarshal := pdwMinimumGRLVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, pdwMinimumGRLVersionMarshal, pdwMinimumGRLVersion, "HRESULT")
        return result
    }
}
