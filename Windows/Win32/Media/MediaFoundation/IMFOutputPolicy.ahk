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
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<Guid>} guidOutputSubType 
     * @param {Pointer<Guid>} rgGuidProtectionSchemasSupported 
     * @param {Integer} cProtectionSchemasSupported 
     * @param {Pointer<IMFCollection>} ppRequiredProtectionSchemas 
     * @returns {HRESULT} 
     */
    GenerateRequiredSchemas(dwAttributes, guidOutputSubType, rgGuidProtectionSchemasSupported, cProtectionSchemasSupported, ppRequiredProtectionSchemas) {
        result := ComCall(33, this, "uint", dwAttributes, "ptr", guidOutputSubType, "ptr", rgGuidProtectionSchemasSupported, "uint", cProtectionSchemasSupported, "ptr", ppRequiredProtectionSchemas, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidOriginatorID 
     * @returns {HRESULT} 
     */
    GetOriginatorID(pguidOriginatorID) {
        result := ComCall(34, this, "ptr", pguidOriginatorID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMinimumGRLVersion 
     * @returns {HRESULT} 
     */
    GetMinimumGRLVersion(pdwMinimumGRLVersion) {
        result := ComCall(35, this, "uint*", pdwMinimumGRLVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
