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
        if(bstrFlagString is String) {
            pin := BSTR.Alloc(bstrFlagString)
            bstrFlagString := pin.Value
        }

        result := ComCall(88, this, "ptr", bstrFlagString, "short", vfFlag, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFlagString 
     * @returns {VARIANT_BOOL} 
     */
    GetExperimentalFlag(bstrFlagString) {
        if(bstrFlagString is String) {
            pin := BSTR.Alloc(bstrFlagString)
            bstrFlagString := pin.Value
        }

        result := ComCall(89, this, "ptr", bstrFlagString, "short*", &vfFlag := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return vfFlag
    }

    /**
     * 
     * @param {BSTR} bstrValueString 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    SetExperimentalValue(bstrValueString, dwValue) {
        if(bstrValueString is String) {
            pin := BSTR.Alloc(bstrValueString)
            bstrValueString := pin.Value
        }

        result := ComCall(90, this, "ptr", bstrValueString, "uint", dwValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrValueString 
     * @returns {Integer} 
     */
    GetExperimentalValue(bstrValueString) {
        if(bstrValueString is String) {
            pin := BSTR.Alloc(bstrValueString)
            bstrValueString := pin.Value
        }

        result := ComCall(91, this, "ptr", bstrValueString, "uint*", &pdwValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwValue
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAllExperimentalFlagsAndValues() {
        result := ComCall(92, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {VARIANT_BOOL} 
     */
    GetNeedIEAutoLaunchFlag(bstrUrl) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }

        result := ComCall(93, this, "ptr", bstrUrl, "short*", &flag := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return flag
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT_BOOL} flag 
     * @returns {HRESULT} 
     */
    SetNeedIEAutoLaunchFlag(bstrUrl, flag) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }

        result := ComCall(94, this, "ptr", bstrUrl, "short", flag, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {VARIANT_BOOL} 
     */
    HasNeedIEAutoLaunchFlag(bstrUrl) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }

        result := ComCall(95, this, "ptr", bstrUrl, "short*", &exists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return exists
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT_BOOL} automated 
     * @returns {HRESULT} 
     */
    LaunchIE(bstrUrl, automated) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }

        result := ComCall(96, this, "ptr", bstrUrl, "short", automated, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
