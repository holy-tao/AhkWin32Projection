#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsPropertySet extends IUnknown{
    /**
     * The interface identifier for IKsPropertySet
     * @type {Guid}
     */
    static IID => Guid("{31efac30-515c-11d0-a9aa-00aa0061be93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidPropSet 
     * @param {Integer} dwPropID 
     * @param {Pointer} pInstanceData 
     * @param {Integer} cbInstanceData 
     * @param {Pointer} pPropData 
     * @param {Integer} cbPropData 
     * @returns {HRESULT} 
     */
    Set(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData) {
        result := ComCall(3, this, "ptr", guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPropSet 
     * @param {Integer} dwPropID 
     * @param {Pointer} pInstanceData 
     * @param {Integer} cbInstanceData 
     * @param {Pointer} pPropData 
     * @param {Integer} cbPropData 
     * @param {Pointer<UInt32>} pcbReturned 
     * @returns {HRESULT} 
     */
    Get(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData, pcbReturned) {
        result := ComCall(4, this, "ptr", guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "uint*", pcbReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPropSet 
     * @param {Integer} dwPropID 
     * @param {Pointer<UInt32>} pTypeSupport 
     * @returns {HRESULT} 
     */
    QuerySupported(guidPropSet, dwPropID, pTypeSupport) {
        result := ComCall(5, this, "ptr", guidPropSet, "uint", dwPropID, "uint*", pTypeSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
