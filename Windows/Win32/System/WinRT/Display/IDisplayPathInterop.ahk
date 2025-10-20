#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Display
 * @version v4.0.30319
 */
class IDisplayPathInterop extends IUnknown{
    /**
     * The interface identifier for IDisplayPathInterop
     * @type {Guid}
     */
    static IID => Guid("{a6ba4205-e59e-4e71-b25b-4e436d21ee3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HANDLE>} pValue 
     * @returns {HRESULT} 
     */
    CreateSourcePresentationHandle(pValue) {
        result := ComCall(3, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSourceId 
     * @returns {HRESULT} 
     */
    GetSourceId(pSourceId) {
        result := ComCall(4, this, "uint*", pSourceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
