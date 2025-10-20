#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreACPServices interface is implemented by the TSF manager to provide various services to an ACP-based application.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itextstoreacpservices
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACPServices extends IUnknown{
    /**
     * The interface identifier for ITextStoreACPServices
     * @type {Guid}
     */
    static IID => Guid("{aa80e901-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfProperty>} pProp 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {Pointer<IStream>} pStream 
     * @returns {HRESULT} 
     */
    Serialize(pProp, pRange, pHdr, pStream) {
        result := ComCall(3, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "int")
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
        result := ComCall(4, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "int")
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
        result := ComCall(5, this, "ptr", pProp, "int")
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
        result := ComCall(6, this, "int", acpStart, "int", acpEnd, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
