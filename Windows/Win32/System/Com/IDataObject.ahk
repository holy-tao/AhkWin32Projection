#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables data transfer and notification of changes in data.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-idataobject
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDataObject extends IUnknown{
    /**
     * The interface identifier for IDataObject
     * @type {Guid}
     */
    static IID => Guid("{0000010e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetcIn 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @returns {HRESULT} 
     */
    GetData(pformatetcIn, pmedium) {
        result := ComCall(3, this, "ptr", pformatetcIn, "ptr", pmedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @returns {HRESULT} 
     */
    GetDataHere(pformatetc, pmedium) {
        result := ComCall(4, this, "ptr", pformatetc, "ptr", pmedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @returns {HRESULT} 
     */
    QueryGetData(pformatetc) {
        result := ComCall(5, this, "ptr", pformatetc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatectIn 
     * @param {Pointer<FORMATETC>} pformatetcOut 
     * @returns {HRESULT} 
     */
    GetCanonicalFormatEtc(pformatectIn, pformatetcOut) {
        result := ComCall(6, this, "ptr", pformatectIn, "ptr", pformatetcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @param {BOOL} fRelease 
     * @returns {HRESULT} 
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDirection 
     * @param {Pointer<IEnumFORMATETC>} ppenumFormatEtc 
     * @returns {HRESULT} 
     */
    EnumFormatEtc(dwDirection, ppenumFormatEtc) {
        result := ComCall(8, this, "uint", dwDirection, "ptr", ppenumFormatEtc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Integer} advf 
     * @param {Pointer<IAdviseSink>} pAdvSink 
     * @param {Pointer<UInt32>} pdwConnection 
     * @returns {HRESULT} 
     */
    DAdvise(pformatetc, advf, pAdvSink, pdwConnection) {
        result := ComCall(9, this, "ptr", pformatetc, "uint", advf, "ptr", pAdvSink, "uint*", pdwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     */
    DUnadvise(dwConnection) {
        result := ComCall(10, this, "uint", dwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumAdvise 
     * @returns {HRESULT} 
     */
    EnumDAdvise(ppenumAdvise) {
        result := ComCall(11, this, "ptr", ppenumAdvise, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
