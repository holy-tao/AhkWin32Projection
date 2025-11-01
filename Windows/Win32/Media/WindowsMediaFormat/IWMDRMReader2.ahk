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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEvaluateOutputLevelLicenses", "GetPlayOutputLevels", "GetCopyOutputLevels", "TryNextLicense"]

    /**
     * 
     * @param {BOOL} fEvaluate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader2-setevaluateoutputlevellicenses
     */
    SetEvaluateOutputLevelLicenses(fEvaluate) {
        result := ComCall(11, this, "int", fEvaluate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DRM_PLAY_OPL>} pPlayOPL 
     * @param {Pointer<Integer>} pcbLength 
     * @param {Pointer<Integer>} pdwMinAppComplianceLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader2-getplayoutputlevels
     */
    GetPlayOutputLevels(pPlayOPL, pcbLength, pdwMinAppComplianceLevel) {
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"
        pdwMinAppComplianceLevelMarshal := pdwMinAppComplianceLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pPlayOPL, pcbLengthMarshal, pcbLength, pdwMinAppComplianceLevelMarshal, pdwMinAppComplianceLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DRM_COPY_OPL>} pCopyOPL 
     * @param {Pointer<Integer>} pcbLength 
     * @param {Pointer<Integer>} pdwMinAppComplianceLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader2-getcopyoutputlevels
     */
    GetCopyOutputLevels(pCopyOPL, pcbLength, pdwMinAppComplianceLevel) {
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"
        pdwMinAppComplianceLevelMarshal := pdwMinAppComplianceLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pCopyOPL, pcbLengthMarshal, pcbLength, pdwMinAppComplianceLevelMarshal, pdwMinAppComplianceLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader2-trynextlicense
     */
    TryNextLicense() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
