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
     * Get started learning the basics of building great desktop apps in this section.
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(dwIndex, pwzBuffer, pcchBufferSize) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferSizeMarshal := pcchBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwIndex, "ptr", pwzBuffer, pcchBufferSizeMarshal, pcchBufferSize, "HRESULT")
        return result
    }
}
