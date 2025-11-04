#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface for opening and closing the database object, and for instantiating objects stored in the database.
 * @see https://docs.microsoft.com/windows/win32/api//infotech/nn-infotech-iitdatabase
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IITDatabase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IITDatabase
     * @type {Guid}
     */
    static IID => Guid("{8fa0d5a2-dedf-11d0-9a61-00c04fb68bf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "CreateObject", "GetObject", "GetObjectPersistence"]

    /**
     * 
     * @param {PWSTR} lpszHost 
     * @param {PWSTR} lpszMoniker 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-open
     */
    Open(lpszHost, lpszMoniker, dwFlags) {
        lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost
        lpszMoniker := lpszMoniker is String ? StrPtr(lpszMoniker) : lpszMoniker

        result := ComCall(3, this, "ptr", lpszHost, "ptr", lpszMoniker, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Integer>} pdwObjInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-createobject
     */
    CreateObject(rclsid, pdwObjInstance) {
        pdwObjInstanceMarshal := pdwObjInstance is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", rclsid, pdwObjInstanceMarshal, pdwObjInstance, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Integer} dwObjInstance 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(dwObjInstance, riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", dwObjInstance, "ptr", riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpwszObject 
     * @param {Integer} dwObjInstance 
     * @param {Pointer<Pointer<Void>>} ppvPersistence 
     * @param {BOOL} fStream 
     * @returns {HRESULT} 
     */
    GetObjectPersistence(lpwszObject, dwObjInstance, ppvPersistence, fStream) {
        lpwszObject := lpwszObject is String ? StrPtr(lpwszObject) : lpwszObject

        ppvPersistenceMarshal := ppvPersistence is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", lpwszObject, "uint", dwObjInstance, ppvPersistenceMarshal, ppvPersistence, "int", fStream, "HRESULT")
        return result
    }
}
