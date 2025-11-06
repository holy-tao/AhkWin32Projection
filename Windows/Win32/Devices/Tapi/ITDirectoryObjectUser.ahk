#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectoryObjectUser interface is the common interface supported by the User object. This interface is created by calling QueryInterface on ITDirectoryObject.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itdirectoryobjectuser
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectoryObjectUser extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDirectoryObjectUser
     * @type {Guid}
     */
    static IID => Guid("{34621d6f-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IPPhonePrimary", "put_IPPhonePrimary"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectuser-get_ipphoneprimary
     */
    get_IPPhonePrimary() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * 
     * @param {BSTR} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectuser-put_ipphoneprimary
     */
    put_IPPhonePrimary(pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(8, this, "ptr", pName, "HRESULT")
        return result
    }
}
