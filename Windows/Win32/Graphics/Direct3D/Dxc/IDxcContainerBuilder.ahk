#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcContainerBuilder extends IUnknown{
    /**
     * The interface identifier for IDxcContainerBuilder
     * @type {Guid}
     */
    static IID => Guid("{334b1f50-2292-4b35-99a1-25588d8c17fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDxcBlob>} pDxilContainerHeader 
     * @returns {HRESULT} 
     */
    Load(pDxilContainerHeader) {
        result := ComCall(3, this, "ptr", pDxilContainerHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fourCC 
     * @param {Pointer<IDxcBlob>} pSource 
     * @returns {HRESULT} 
     */
    AddPart(fourCC, pSource) {
        result := ComCall(4, this, "uint", fourCC, "ptr", pSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fourCC 
     * @returns {HRESULT} 
     */
    RemovePart(fourCC) {
        result := ComCall(5, this, "uint", fourCC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcOperationResult>} ppResult 
     * @returns {HRESULT} 
     */
    SerializeContainer(ppResult) {
        result := ComCall(6, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
