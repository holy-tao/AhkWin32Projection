#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages advisory connections and compound document notifications in an object server.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleadviseholder
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleAdviseHolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleAdviseHolder
     * @type {Guid}
     */
    static IID => Guid("{00000111-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "EnumAdvise", "SendOnRename", "SendOnSave", "SendOnClose"]

    /**
     * 
     * @param {IAdviseSink} pAdvise 
     * @param {Pointer<Integer>} pdwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleadviseholder-advise
     */
    Advise(pAdvise, pdwConnection) {
        result := ComCall(3, this, "ptr", pAdvise, "uint*", pdwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleadviseholder-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumAdvise 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleadviseholder-enumadvise
     */
    EnumAdvise(ppenumAdvise) {
        result := ComCall(5, this, "ptr*", ppenumAdvise, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleadviseholder-sendonrename
     */
    SendOnRename(pmk) {
        result := ComCall(6, this, "ptr", pmk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleadviseholder-sendonsave
     */
    SendOnSave() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleadviseholder-sendonclose
     */
    SendOnClose() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
