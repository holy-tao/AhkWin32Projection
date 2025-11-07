#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_PERSISTENT_PROPERTY_HEADER_ACP.ahk
#Include .\ITfRangeACP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreACPServices interface is implemented by the TSF manager to provide various services to an ACP-based application.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itextstoreacpservices
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACPServices extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Serialize", "Unserialize", "ForceLoadProperty", "CreateRange"]

    /**
     * 
     * @param {ITfProperty} pProp 
     * @param {ITfRange} pRange 
     * @param {IStream} pStream 
     * @returns {TF_PERSISTENT_PROPERTY_HEADER_ACP} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-serialize
     */
    Serialize(pProp, pRange, pStream) {
        pHdr := TF_PERSISTENT_PROPERTY_HEADER_ACP()
        result := ComCall(3, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "HRESULT")
        return pHdr
    }

    /**
     * 
     * @param {ITfProperty} pProp 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {IStream} pStream 
     * @param {ITfPersistentPropertyLoaderACP} pLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-unserialize
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(4, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfProperty} pProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-forceloadproperty
     */
    ForceLoadProperty(pProp) {
        result := ComCall(5, this, "ptr", pProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @returns {ITfRangeACP} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-createrange
     */
    CreateRange(acpStart, acpEnd) {
        result := ComCall(6, this, "int", acpStart, "int", acpEnd, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRangeACP(ppRange)
    }
}
