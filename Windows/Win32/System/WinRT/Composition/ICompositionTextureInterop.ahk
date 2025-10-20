#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionTextureInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionTextureInterop
     * @type {Guid}
     */
    static IID => Guid("{d528a265-f0a5-422f-a39d-ef62d7cd1cc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableFence"]

    /**
     * 
     * @param {Pointer<Integer>} fenceValue 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} availableFence 
     * @returns {HRESULT} 
     */
    GetAvailableFence(fenceValue, iid, availableFence) {
        result := ComCall(3, this, "uint*", fenceValue, "ptr", iid, "ptr*", availableFence, "HRESULT")
        return result
    }
}
