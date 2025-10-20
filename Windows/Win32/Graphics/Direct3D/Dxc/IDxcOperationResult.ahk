#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcOperationResult extends IUnknown{
    /**
     * The interface identifier for IDxcOperationResult
     * @type {Guid}
     */
    static IID => Guid("{cedb484a-d4e9-445a-b991-ca21ca157dc2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HRESULT>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(3, this, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    GetResult(ppResult) {
        result := ComCall(4, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlobEncoding>} ppErrors 
     * @returns {HRESULT} 
     */
    GetErrorBuffer(ppErrors) {
        result := ComCall(5, this, "ptr", ppErrors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
