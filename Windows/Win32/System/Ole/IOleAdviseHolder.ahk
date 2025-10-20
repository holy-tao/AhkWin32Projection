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
     * 
     * @param {Pointer<IAdviseSink>} pAdvise 
     * @param {Pointer<UInt32>} pdwConnection 
     * @returns {HRESULT} 
     */
    Advise(pAdvise, pdwConnection) {
        result := ComCall(3, this, "ptr", pAdvise, "uint*", pdwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     */
    Unadvise(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumAdvise 
     * @returns {HRESULT} 
     */
    EnumAdvise(ppenumAdvise) {
        result := ComCall(5, this, "ptr", ppenumAdvise, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmk 
     * @returns {HRESULT} 
     */
    SendOnRename(pmk) {
        result := ComCall(6, this, "ptr", pmk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SendOnSave() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SendOnClose() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
