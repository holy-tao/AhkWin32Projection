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
     * 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Integer} advf 
     * @param {Pointer<UInt32>} pdwConnection 
     * @returns {HRESULT} 
     */
    Cache(pformatetc, advf, pdwConnection) {
        result := ComCall(3, this, "ptr", pformatetc, "uint", advf, "uint*", pdwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     */
    Uncache(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumSTATDATA 
     * @returns {HRESULT} 
     */
    EnumCache(ppenumSTATDATA) {
        result := ComCall(5, this, "ptr", ppenumSTATDATA, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pDataObject 
     * @returns {HRESULT} 
     */
    InitCache(pDataObject) {
        result := ComCall(6, this, "ptr", pDataObject, "int")
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
}
