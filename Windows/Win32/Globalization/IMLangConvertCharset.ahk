#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangConvertCharset extends IUnknown {
    /**
     * The interface identifier for IMLangConvertCharset
     * @type {Guid}
     */
    static IID := Guid("{d66d6f98-cdaa-11d0-b822-00c04fc9b31f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangConvertCharset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize              : IntPtr
        GetSourceCodePage       : IntPtr
        GetDestinationCodePage  : IntPtr
        GetProperty             : IntPtr
        DoConversion            : IntPtr
        DoConversionToUnicode   : IntPtr
        DoConversionFromUnicode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangConvertCharset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {Integer} uiSrcCodePage 
     * @param {Integer} uiDstCodePage 
     * @param {Integer} dwProperty 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(uiSrcCodePage, uiDstCodePage, dwProperty) {
        result := ComCall(3, this, "uint", uiSrcCodePage, "uint", uiDstCodePage, "uint", dwProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSourceCodePage() {
        result := ComCall(4, this, "uint*", &puiSrcCodePage := 0, "HRESULT")
        return puiSrcCodePage
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDestinationCodePage() {
        result := ComCall(5, this, "uint*", &puiDstCodePage := 0, "HRESULT")
        return puiDstCodePage
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty() {
        result := ComCall(6, this, "uint*", &pdwProperty := 0, "HRESULT")
        return pdwProperty
    }

    /**
     * 
     * @param {Integer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Integer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    DoConversion(pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {PWSTR} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    DoConversionToUnicode(pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pDstStr := pDstStr is String ? StrPtr(pDstStr) : pDstStr

        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Integer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    DoConversionFromUnicode(pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pSrcStr := pSrcStr is String ? StrPtr(pSrcStr) : pSrcStr

        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLangConvertCharset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.GetSourceCodePage := CallbackCreate(GetMethod(implObj, "GetSourceCodePage"), flags, 2)
        this.vtbl.GetDestinationCodePage := CallbackCreate(GetMethod(implObj, "GetDestinationCodePage"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 2)
        this.vtbl.DoConversion := CallbackCreate(GetMethod(implObj, "DoConversion"), flags, 5)
        this.vtbl.DoConversionToUnicode := CallbackCreate(GetMethod(implObj, "DoConversionToUnicode"), flags, 5)
        this.vtbl.DoConversionFromUnicode := CallbackCreate(GetMethod(implObj, "DoConversionFromUnicode"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetSourceCodePage)
        CallbackFree(this.vtbl.GetDestinationCodePage)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.DoConversion)
        CallbackFree(this.vtbl.DoConversionToUnicode)
        CallbackFree(this.vtbl.DoConversionFromUnicode)
    }
}
