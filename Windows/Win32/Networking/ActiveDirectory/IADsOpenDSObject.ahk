#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsOpenDSObject interface is designed to supply a security context for binding to an object in the underlying directory store.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsopendsobject
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsOpenDSObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsOpenDSObject
     * @type {Guid}
     */
    static IID => Guid("{ddf2891e-0f9c-11d0-8ad4-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDSObject"]

    /**
     * 
     * @param {BSTR} lpszDNName 
     * @param {BSTR} lpszUserName 
     * @param {BSTR} lpszPassword 
     * @param {Integer} lnReserved 
     * @param {Pointer<IDispatch>} ppOleDsObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsopendsobject-opendsobject
     */
    OpenDSObject(lpszDNName, lpszUserName, lpszPassword, lnReserved, ppOleDsObj) {
        lpszDNName := lpszDNName is String ? BSTR.Alloc(lpszDNName).Value : lpszDNName
        lpszUserName := lpszUserName is String ? BSTR.Alloc(lpszUserName).Value : lpszUserName
        lpszPassword := lpszPassword is String ? BSTR.Alloc(lpszPassword).Value : lpszPassword

        result := ComCall(7, this, "ptr", lpszDNName, "ptr", lpszUserName, "ptr", lpszPassword, "int", lnReserved, "ptr*", ppOleDsObj, "HRESULT")
        return result
    }
}
