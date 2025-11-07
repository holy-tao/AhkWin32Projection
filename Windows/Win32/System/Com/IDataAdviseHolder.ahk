#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSTATDATA.ahk
#Include .\IUnknown.ahk

/**
 * Creates and manages advisory connections between a data object and one or more advise sinks.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-idataadviseholder
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDataAdviseHolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataAdviseHolder
     * @type {Guid}
     */
    static IID => Guid("{00000110-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "EnumAdvise", "SendOnDataChange"]

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {Pointer<FORMATETC>} pFetc 
     * @param {Integer} advf 
     * @param {IAdviseSink} pAdvise 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataadviseholder-advise
     */
    Advise(pDataObject, pFetc, advf, pAdvise) {
        result := ComCall(3, this, "ptr", pDataObject, "ptr", pFetc, "uint", advf, "ptr", pAdvise, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataadviseholder-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSTATDATA} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataadviseholder-enumadvise
     */
    EnumAdvise() {
        result := ComCall(5, this, "ptr*", &ppenumAdvise := 0, "HRESULT")
        return IEnumSTATDATA(ppenumAdvise)
    }

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {Integer} advf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataadviseholder-sendondatachange
     */
    SendOnDataChange(pDataObject, advf) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "ptr", pDataObject, "uint", dwReserved, "uint", advf, "HRESULT")
        return result
    }
}
