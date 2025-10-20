#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzApplication.ahk

/**
 * Inherits from the IAzApplication interface and implements additional methods to initialize IAzClientContext2 objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplication2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplication2 extends IAzApplication{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzApplication2
     * @type {Guid}
     */
    static IID => Guid("{086a68af-a249-437c-b18d-d4d86d6a9660}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 68

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeClientContextFromToken2", "InitializeClientContext2"]

    /**
     * 
     * @param {Integer} ulTokenHandleLowPart 
     * @param {Integer} ulTokenHandleHighPart 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzClientContext2>} ppClientContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication2-initializeclientcontextfromtoken2
     */
    InitializeClientContextFromToken2(ulTokenHandleLowPart, ulTokenHandleHighPart, varReserved, ppClientContext) {
        result := ComCall(68, this, "uint", ulTokenHandleLowPart, "uint", ulTokenHandleHighPart, "ptr", varReserved, "ptr*", ppClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} IdentifyingString 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzClientContext2>} ppClientContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication2-initializeclientcontext2
     */
    InitializeClientContext2(IdentifyingString, varReserved, ppClientContext) {
        IdentifyingString := IdentifyingString is String ? BSTR.Alloc(IdentifyingString).Value : IdentifyingString

        result := ComCall(69, this, "ptr", IdentifyingString, "ptr", varReserved, "ptr*", ppClientContext, "HRESULT")
        return result
    }
}
