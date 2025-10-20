#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Creates and manages advisory connections between a data object and one or more advise sinks.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-idataadviseholder
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDataAdviseHolder extends IUnknown{
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
     * 
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {Pointer<FORMATETC>} pFetc 
     * @param {Integer} advf 
     * @param {Pointer<IAdviseSink>} pAdvise 
     * @param {Pointer<UInt32>} pdwConnection 
     * @returns {HRESULT} 
     */
    Advise(pDataObject, pFetc, advf, pAdvise, pdwConnection) {
        result := ComCall(3, this, "ptr", pDataObject, "ptr", pFetc, "uint", advf, "ptr", pAdvise, "uint*", pdwConnection, "int")
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
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {Integer} advf 
     * @returns {HRESULT} 
     */
    SendOnDataChange(pDataObject, advf) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "ptr", pDataObject, "uint", dwReserved, "uint", advf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
