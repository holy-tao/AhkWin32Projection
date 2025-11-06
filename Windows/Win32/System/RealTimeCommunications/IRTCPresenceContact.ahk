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
     * @returns {BSTR} 
     */
    get_PresentityURI() {
        pbstrPresentityURI := BSTR()
        result := ComCall(3, this, "ptr", pbstrPresentityURI, "HRESULT")
        return pbstrPresentityURI
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
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(5, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
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
     * @returns {BSTR} 
     */
    get_Data() {
        pbstrData := BSTR()
        result := ComCall(7, this, "ptr", pbstrData, "HRESULT")
        return pbstrData
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
     * @returns {VARIANT_BOOL} 
     */
    get_Persistent() {
        result := ComCall(9, this, "short*", &pfPersistent := 0, "HRESULT")
        return pfPersistent
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
