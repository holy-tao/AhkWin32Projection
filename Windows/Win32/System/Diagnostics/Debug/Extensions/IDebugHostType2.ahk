#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType2.ahk
#Include .\IDebugHostType.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType2 extends IDebugHostType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostType2
     * @type {Guid}
     */
    static IID => Guid("{b28632b9-8506-4676-87ce-8f7e05e59876}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTypedef", "GetTypedefBaseType", "GetTypedefFinalBaseType", "GetFunctionVarArgsKind", "GetFunctionInstancePointerType"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsTypedef() {
        result := ComCall(29, this, "int*", &isTypedef := 0, "HRESULT")
        return isTypedef
    }

    /**
     * 
     * @returns {IDebugHostType2} 
     */
    GetTypedefBaseType() {
        result := ComCall(30, this, "ptr*", &baseType := 0, "HRESULT")
        return IDebugHostType2(baseType)
    }

    /**
     * 
     * @returns {IDebugHostType2} 
     */
    GetTypedefFinalBaseType() {
        result := ComCall(31, this, "ptr*", &finalBaseType := 0, "HRESULT")
        return IDebugHostType2(finalBaseType)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFunctionVarArgsKind() {
        result := ComCall(32, this, "int*", &varArgsKind := 0, "HRESULT")
        return varArgsKind
    }

    /**
     * 
     * @returns {IDebugHostType2} 
     */
    GetFunctionInstancePointerType() {
        result := ComCall(33, this, "ptr*", &instancePointerType := 0, "HRESULT")
        return IDebugHostType2(instancePointerType)
    }
}
