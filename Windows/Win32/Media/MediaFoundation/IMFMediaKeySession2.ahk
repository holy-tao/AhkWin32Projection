#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMFMediaKeySession.ahk" { IMFMediaKeySession }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MFMediaKeyStatus.ahk" { MFMediaKeyStatus }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeySession2 extends IMFMediaKeySession {
    /**
     * The interface identifier for IMFMediaKeySession2
     * @type {Guid}
     */
    static IID := Guid("{e9707e05-6d55-4636-b185-3de21210bd75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeySession2 interfaces
    */
    struct Vtbl extends IMFMediaKeySession.Vtbl {
        get_KeyStatuses : IntPtr
        Load            : IntPtr
        GenerateRequest : IntPtr
        get_Expiration  : IntPtr
        Remove          : IntPtr
        Shutdown        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeySession2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Reads texel data without any filtering or sampling.
     * @param {BSTR} bstrSessionId 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(bstrSessionId) {
        bstrSessionId := bstrSessionId is String ? BSTR.Alloc(bstrSessionId).Value : bstrSessionId

        result := ComCall(9, this, BSTR, bstrSessionId, BOOL.Ptr, &pfLoaded := 0, "HRESULT")
        return pfLoaded
    }

    /**
     * 
     * @param {BSTR} initDataType 
     * @param {Integer} pbInitData 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    GenerateRequest(initDataType, pbInitData, cb) {
        initDataType := initDataType is String ? BSTR.Alloc(initDataType).Value : initDataType

        result := ComCall(10, this, BSTR, initDataType, "ptr", pbInitData, "uint", cb, "HRESULT")
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
     * Stops the collector. If the collector is running as a service, stopping the service is the better approach.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-shutdown
     */
    Shutdown() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaKeySession2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_KeyStatuses := CallbackCreate(GetMethod(implObj, "get_KeyStatuses"), flags, 3)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 3)
        this.vtbl.GenerateRequest := CallbackCreate(GetMethod(implObj, "GenerateRequest"), flags, 4)
        this.vtbl.get_Expiration := CallbackCreate(GetMethod(implObj, "get_Expiration"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 1)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_KeyStatuses)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.GenerateRequest)
        CallbackFree(this.vtbl.get_Expiration)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Shutdown)
    }
}
