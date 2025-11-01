#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRProbingAssemblyEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRProbingAssemblyEnum
     * @type {Guid}
     */
    static IID => Guid("{d0c5fb1f-416b-4f97-81f4-7ac7dc24dd5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Get"]

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBufferSize 
     * @returns {HRESULT} 
     */
    Get(dwIndex, pwzBuffer, pcchBufferSize) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(3, this, "uint", dwIndex, "ptr", pwzBuffer, "uint*", pcchBufferSize, "HRESULT")
        return result
    }
}
