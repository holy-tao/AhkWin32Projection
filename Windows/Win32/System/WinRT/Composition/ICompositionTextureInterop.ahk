#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionTextureInterop extends IUnknown{
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
     * 
     * @param {Pointer<UInt64>} fenceValue 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} availableFence 
     * @returns {HRESULT} 
     */
    GetAvailableFence(fenceValue, iid, availableFence) {
        result := ComCall(3, this, "uint*", fenceValue, "ptr", iid, "ptr", availableFence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
