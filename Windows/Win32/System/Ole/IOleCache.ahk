#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides control of the presentation data that gets cached inside of an object. Cached presentation data is available to the container of the object even when the server application is not running or is unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecache
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCache
     * @type {Guid}
     */
    static IID => Guid("{0000011e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cache", "Uncache", "EnumCache", "InitCache", "SetData"]

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Integer} advf 
     * @param {Pointer<Integer>} pdwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache-cache
     */
    Cache(pformatetc, advf, pdwConnection) {
        result := ComCall(3, this, "ptr", pformatetc, "uint", advf, "uint*", pdwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache-uncache
     */
    Uncache(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumSTATDATA 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache-enumcache
     */
    EnumCache(ppenumSTATDATA) {
        result := ComCall(5, this, "ptr*", ppenumSTATDATA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache-initcache
     */
    InitCache(pDataObject) {
        result := ComCall(6, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @param {BOOL} fRelease 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache-setdata
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "HRESULT")
        return result
    }
}
