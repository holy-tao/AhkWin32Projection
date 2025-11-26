#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaKeySession.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySession2 extends IMFMediaKeySession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeySession2
     * @type {Guid}
     */
    static IID => Guid("{e9707e05-6d55-4636-b185-3de21210bd75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyStatuses", "Load", "GenerateRequest", "get_Expiration", "Remove", "Shutdown"]

    /**
     * @type {Float} 
     */
    Expiration {
        get => this.get_Expiration()
    }

    /**
     * 
     * @param {Pointer<Pointer<MFMediaKeyStatus>>} pKeyStatusesArray 
     * @param {Pointer<Integer>} puSize 
     * @returns {HRESULT} 
     */
    get_KeyStatuses(pKeyStatusesArray, puSize) {
        pKeyStatusesArrayMarshal := pKeyStatusesArray is VarRef ? "ptr*" : "ptr"
        puSizeMarshal := puSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pKeyStatusesArrayMarshal, pKeyStatusesArray, puSizeMarshal, puSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSessionId 
     * @returns {BOOL} 
     */
    Load(bstrSessionId) {
        bstrSessionId := bstrSessionId is String ? BSTR.Alloc(bstrSessionId).Value : bstrSessionId

        result := ComCall(9, this, "ptr", bstrSessionId, "int*", &pfLoaded := 0, "HRESULT")
        return pfLoaded
    }

    /**
     * 
     * @param {BSTR} initDataType 
     * @param {Pointer} pbInitData 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    GenerateRequest(initDataType, pbInitData, cb) {
        initDataType := initDataType is String ? BSTR.Alloc(initDataType).Value : initDataType

        result := ComCall(10, this, "ptr", initDataType, "ptr", pbInitData, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Expiration() {
        result := ComCall(11, this, "double*", &dblExpiration := 0, "HRESULT")
        return dblExpiration
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Remove() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
