#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetBindInfo.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetBindInfoEx extends IInternetBindInfo{
    /**
     * The interface identifier for IInternetBindInfoEx
     * @type {Guid}
     */
    static IID => Guid("{a3e015b7-a82c-4dcd-a150-569aeeed36ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<UInt32>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @param {Pointer<UInt32>} grfBINDF2 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetBindInfoEx(grfBINDF, pbindinfo, grfBINDF2, pdwReserved) {
        result := ComCall(5, this, "uint*", grfBINDF, "ptr", pbindinfo, "uint*", grfBINDF2, "uint*", pdwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
