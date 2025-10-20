#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMReader.ahk

/**
 * The IWMDRMReader2 interface provides methods for examining the rights granted by DRM version 10 licenses.An IWMDRMReader2 interface exists for every instance of the reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmreader2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader2 extends IWMDRMReader{
    /**
     * The interface identifier for IWMDRMReader2
     * @type {Guid}
     */
    static IID => Guid("{befe7a75-9f1d-4075-b9d9-a3c37bda49a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {BOOL} fEvaluate 
     * @returns {HRESULT} 
     */
    SetEvaluateOutputLevelLicenses(fEvaluate) {
        result := ComCall(11, this, "int", fEvaluate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DRM_PLAY_OPL>} pPlayOPL 
     * @param {Pointer<UInt32>} pcbLength 
     * @param {Pointer<UInt32>} pdwMinAppComplianceLevel 
     * @returns {HRESULT} 
     */
    GetPlayOutputLevels(pPlayOPL, pcbLength, pdwMinAppComplianceLevel) {
        result := ComCall(12, this, "ptr", pPlayOPL, "uint*", pcbLength, "uint*", pdwMinAppComplianceLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DRM_COPY_OPL>} pCopyOPL 
     * @param {Pointer<UInt32>} pcbLength 
     * @param {Pointer<UInt32>} pdwMinAppComplianceLevel 
     * @returns {HRESULT} 
     */
    GetCopyOutputLevels(pCopyOPL, pcbLength, pdwMinAppComplianceLevel) {
        result := ComCall(13, this, "ptr", pCopyOPL, "uint*", pcbLength, "uint*", pdwMinAppComplianceLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TryNextLicense() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
