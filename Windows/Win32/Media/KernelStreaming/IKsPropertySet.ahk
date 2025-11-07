#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsPropertySet extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "Get", "QuerySupported"]

    /**
     * 
     * @param {Pointer<Guid>} guidPropSet 
     * @param {Integer} dwPropID 
     * @param {Pointer} pInstanceData 
     * @param {Integer} cbInstanceData 
     * @param {Pointer} pPropData 
     * @param {Integer} cbPropData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-set
     */
    Set(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData) {
        result := ComCall(3, this, "ptr", guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "HRESULT")
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-get
     */
    Get(guidPropSet, dwPropID, pInstanceData, cbInstanceData, pPropData, cbPropData) {
        result := ComCall(4, this, "ptr", guidPropSet, "uint", dwPropID, "ptr", pInstanceData, "uint", cbInstanceData, "ptr", pPropData, "uint", cbPropData, "uint*", &pcbReturned := 0, "HRESULT")
        return pcbReturned
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPropSet 
     * @param {Integer} dwPropID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspropertyset-querysupported
     */
    QuerySupported(guidPropSet, dwPropID) {
        result := ComCall(5, this, "ptr", guidPropSet, "uint", dwPropID, "uint*", &pTypeSupport := 0, "HRESULT")
        return pTypeSupport
    }
}
