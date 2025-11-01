#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPresenceContact extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPresenceContact
     * @type {Guid}
     */
    static IID => Guid("{8b22f92c-cd90-42db-a733-212205c3e3df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PresentityURI", "put_PresentityURI", "get_Name", "put_Name", "get_Data", "put_Data", "get_Persistent", "put_Persistent"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPresentityURI 
     * @returns {HRESULT} 
     */
    get_PresentityURI(pbstrPresentityURI) {
        result := ComCall(3, this, "ptr", pbstrPresentityURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @returns {HRESULT} 
     */
    put_PresentityURI(bstrPresentityURI) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(4, this, "ptr", bstrPresentityURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(6, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    get_Data(pbstrData) {
        result := ComCall(7, this, "ptr", pbstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrData 
     * @returns {HRESULT} 
     */
    put_Data(bstrData) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(8, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfPersistent 
     * @returns {HRESULT} 
     */
    get_Persistent(pfPersistent) {
        result := ComCall(9, this, "ptr", pfPersistent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPersistent 
     * @returns {HRESULT} 
     */
    put_Persistent(fPersistent) {
        result := ComCall(10, this, "short", fPersistent, "HRESULT")
        return result
    }
}
