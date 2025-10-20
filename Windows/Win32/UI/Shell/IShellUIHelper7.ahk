#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper6.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper7 extends IShellUIHelper6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper7
     * @type {Guid}
     */
    static IID => Guid("{60e567c8-9573-4ab2-a264-637c6c161cb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 88

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetExperimentalFlag", "GetExperimentalFlag", "SetExperimentalValue", "GetExperimentalValue", "ResetAllExperimentalFlagsAndValues", "GetNeedIEAutoLaunchFlag", "SetNeedIEAutoLaunchFlag", "HasNeedIEAutoLaunchFlag", "LaunchIE"]

    /**
     * 
     * @param {BSTR} bstrFlagString 
     * @param {VARIANT_BOOL} vfFlag 
     * @returns {HRESULT} 
     */
    SetExperimentalFlag(bstrFlagString, vfFlag) {
        bstrFlagString := bstrFlagString is String ? BSTR.Alloc(bstrFlagString).Value : bstrFlagString

        result := ComCall(88, this, "ptr", bstrFlagString, "short", vfFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFlagString 
     * @param {Pointer<VARIANT_BOOL>} vfFlag 
     * @returns {HRESULT} 
     */
    GetExperimentalFlag(bstrFlagString, vfFlag) {
        bstrFlagString := bstrFlagString is String ? BSTR.Alloc(bstrFlagString).Value : bstrFlagString

        result := ComCall(89, this, "ptr", bstrFlagString, "ptr", vfFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrValueString 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    SetExperimentalValue(bstrValueString, dwValue) {
        bstrValueString := bstrValueString is String ? BSTR.Alloc(bstrValueString).Value : bstrValueString

        result := ComCall(90, this, "ptr", bstrValueString, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrValueString 
     * @param {Pointer<Integer>} pdwValue 
     * @returns {HRESULT} 
     */
    GetExperimentalValue(bstrValueString, pdwValue) {
        bstrValueString := bstrValueString is String ? BSTR.Alloc(bstrValueString).Value : bstrValueString

        result := ComCall(91, this, "ptr", bstrValueString, "uint*", pdwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAllExperimentalFlagsAndValues() {
        result := ComCall(92, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<VARIANT_BOOL>} flag 
     * @returns {HRESULT} 
     */
    GetNeedIEAutoLaunchFlag(bstrUrl, flag) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(93, this, "ptr", bstrUrl, "ptr", flag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT_BOOL} flag 
     * @returns {HRESULT} 
     */
    SetNeedIEAutoLaunchFlag(bstrUrl, flag) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(94, this, "ptr", bstrUrl, "short", flag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<VARIANT_BOOL>} exists 
     * @returns {HRESULT} 
     */
    HasNeedIEAutoLaunchFlag(bstrUrl, exists) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(95, this, "ptr", bstrUrl, "ptr", exists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT_BOOL} automated 
     * @returns {HRESULT} 
     */
    LaunchIE(bstrUrl, automated) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(96, this, "ptr", bstrUrl, "short", automated, "HRESULT")
        return result
    }
}
