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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLayoutChange", "OnStatusChange", "OnAttributeChange", "Serialize", "Unserialize", "ForceLoadProperty", "CreateRange"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-onlayoutchange
     */
    OnLayoutChange() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidAttribute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-onattributechange
     */
    OnAttributeChange(rguidAttribute) {
        result := ComCall(5, this, "ptr", rguidAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfProperty} pProp 
     * @param {ITfRange} pRange 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-serialize
     */
    Serialize(pProp, pRange, pHdr, pStream) {
        result := ComCall(6, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfProperty} pProp 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {IStream} pStream 
     * @param {ITfPersistentPropertyLoaderACP} pLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-unserialize
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(7, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfProperty} pProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-forceloadproperty
     */
    ForceLoadProperty(pProp) {
        result := ComCall(8, this, "ptr", pProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<ITfRangeACP>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownerservices-createrange
     */
    CreateRange(acpStart, acpEnd, ppRange) {
        result := ComCall(9, this, "int", acpStart, "int", acpEnd, "ptr*", ppRange, "HRESULT")
        return result
    }
}
