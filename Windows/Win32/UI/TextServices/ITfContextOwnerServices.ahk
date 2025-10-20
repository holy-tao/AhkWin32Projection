#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwnerServices interface is implemented by the manager and used by a text service or application acting as context owners.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextownerservices
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwnerServices extends IUnknown{
    /**
     * The interface identifier for ITfContextOwnerServices
     * @type {Guid}
     */
    static IID => Guid("{b23eb630-3e1c-11d3-a745-0050040ab407}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    OnLayoutChange() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OnStatusChange(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidAttribute 
     * @returns {HRESULT} 
     */
    OnAttributeChange(rguidAttribute) {
        result := ComCall(5, this, "ptr", rguidAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfProperty>} pProp 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {Pointer<IStream>} pStream 
     * @returns {HRESULT} 
     */
    Serialize(pProp, pRange, pHdr, pStream) {
        result := ComCall(6, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfProperty>} pProp 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<ITfPersistentPropertyLoaderACP>} pLoader 
     * @returns {HRESULT} 
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(7, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfProperty>} pProp 
     * @returns {HRESULT} 
     */
    ForceLoadProperty(pProp) {
        result := ComCall(8, this, "ptr", pProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<ITfRangeACP>} ppRange 
     * @returns {HRESULT} 
     */
    CreateRange(acpStart, acpEnd, ppRange) {
        result := ComCall(9, this, "int", acpStart, "int", acpEnd, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
