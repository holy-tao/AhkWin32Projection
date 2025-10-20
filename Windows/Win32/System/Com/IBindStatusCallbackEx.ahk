#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBindStatusCallback.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindStatusCallbackEx extends IBindStatusCallback{
    /**
     * The interface identifier for IBindStatusCallbackEx
     * @type {Guid}
     */
    static IID => Guid("{aaa74ef9-8ee7-4659-88d9-f8c504da73cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<UInt32>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @param {Pointer<UInt32>} grfBINDF2 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetBindInfoEx(grfBINDF, pbindinfo, grfBINDF2, pdwReserved) {
        result := ComCall(11, this, "uint*", grfBINDF, "ptr", pbindinfo, "uint*", grfBINDF2, "uint*", pdwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
