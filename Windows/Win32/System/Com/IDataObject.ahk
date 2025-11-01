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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "GetDataHere", "QueryGetData", "GetCanonicalFormatEtc", "SetData", "EnumFormatEtc", "DAdvise", "DUnadvise", "EnumDAdvise"]

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetcIn 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-getdata
     */
    GetData(pformatetcIn, pmedium) {
        result := ComCall(3, this, "ptr", pformatetcIn, "ptr", pmedium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-getdatahere
     */
    GetDataHere(pformatetc, pmedium) {
        result := ComCall(4, this, "ptr", pformatetc, "ptr", pmedium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-querygetdata
     */
    QueryGetData(pformatetc) {
        result := ComCall(5, this, "ptr", pformatetc, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatectIn 
     * @param {Pointer<FORMATETC>} pformatetcOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-getcanonicalformatetc
     */
    GetCanonicalFormatEtc(pformatectIn, pformatetcOut) {
        result := ComCall(6, this, "ptr", pformatectIn, "ptr", pformatetcOut, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @param {BOOL} fRelease 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-setdata
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDirection 
     * @param {Pointer<IEnumFORMATETC>} ppenumFormatEtc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-enumformatetc
     */
    EnumFormatEtc(dwDirection, ppenumFormatEtc) {
        result := ComCall(8, this, "uint", dwDirection, "ptr*", ppenumFormatEtc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Integer} advf 
     * @param {IAdviseSink} pAdvSink 
     * @param {Pointer<Integer>} pdwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-dadvise
     */
    DAdvise(pformatetc, advf, pAdvSink, pdwConnection) {
        pdwConnectionMarshal := pdwConnection is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pformatetc, "uint", advf, "ptr", pAdvSink, pdwConnectionMarshal, pdwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-dunadvise
     */
    DUnadvise(dwConnection) {
        result := ComCall(10, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumAdvise 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idataobject-enumdadvise
     */
    EnumDAdvise(ppenumAdvise) {
        result := ComCall(11, this, "ptr*", ppenumAdvise, "HRESULT")
        return result
    }
}
