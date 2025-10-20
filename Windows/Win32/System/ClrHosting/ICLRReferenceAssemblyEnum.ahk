#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRReferenceAssemblyEnum extends IUnknown{
    /**
     * The interface identifier for ICLRReferenceAssemblyEnum
     * @type {Guid}
     */
    static IID => Guid("{d509cb5d-cf32-4876-ae61-67770cf91973}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<UInt32>} pcchBufferSize 
     * @returns {HRESULT} 
     */
    Get(dwIndex, pwzBuffer, pcchBufferSize) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(3, this, "uint", dwIndex, "ptr", pwzBuffer, "uint*", pcchBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
