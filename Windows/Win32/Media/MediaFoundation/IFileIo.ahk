#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FILE_OPENMODE.ahk" { FILE_OPENMODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SEEK_ORIGIN.ahk" { SEEK_ORIGIN }
#Import ".\FILE_ACCESSMODE.ahk" { FILE_ACCESSMODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IFileIo extends IUnknown {
    /**
     * The interface identifier for IFileIo
     * @type {Guid}
     */
    static IID := Guid("{11993196-1244-4840-ab44-480975c4ffe4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileIo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize         : IntPtr
        GetLength          : IntPtr
        SetLength          : IntPtr
        GetCurrentPosition : IntPtr
        SetCurrentPosition : IntPtr
        IsEndOfStream      : IntPtr
        Read               : IntPtr
        Write              : IntPtr
        Seek               : IntPtr
        Close              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileIo.Vtbl()
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
     * @param {FILE_ACCESSMODE} eAccessMode 
     * @param {FILE_OPENMODE} eOpenMode 
     * @param {PWSTR} pwszFileName 
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
    Initialize(eAccessMode, eOpenMode, pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, FILE_ACCESSMODE, eAccessMode, FILE_OPENMODE, eOpenMode, "ptr", pwszFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwLength 
     * @returns {HRESULT} 
     */
    GetLength(pqwLength) {
        pqwLengthMarshal := pqwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pqwLengthMarshal, pqwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} qwLength 
     * @returns {HRESULT} 
     */
    SetLength(qwLength) {
        result := ComCall(5, this, "uint", qwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwPosition 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(pqwPosition) {
        pqwPositionMarshal := pqwPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pqwPositionMarshal, pqwPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} qwPosition 
     * @returns {HRESULT} 
     */
    SetCurrentPosition(qwPosition) {
        result := ComCall(7, this, "uint", qwPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEndOfStream 
     * @returns {HRESULT} 
     */
    IsEndOfStream(pbEndOfStream) {
        pbEndOfStreamMarshal := pbEndOfStream is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pbEndOfStreamMarshal, pbEndOfStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbt 
     * @param {Integer} ul 
     * @param {Pointer<Integer>} pulRead 
     * @returns {HRESULT} 
     */
    Read(pbt, ul, pulRead) {
        pbtMarshal := pbt is VarRef ? "char*" : "ptr"
        pulReadMarshal := pulRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pbtMarshal, pbt, "uint", ul, pulReadMarshal, pulRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbt 
     * @param {Integer} ul 
     * @param {Pointer<Integer>} pulWritten 
     * @returns {HRESULT} 
     */
    Write(pbt, ul, pulWritten) {
        pbtMarshal := pbt is VarRef ? "char*" : "ptr"
        pulWrittenMarshal := pulWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pbtMarshal, pbt, "uint", ul, pulWrittenMarshal, pulWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SEEK_ORIGIN} eSeekOrigin 
     * @param {Integer} qwSeekOffset 
     * @param {Integer} dwSeekFlags 
     * @param {Pointer<Integer>} pqwCurrentPosition 
     * @returns {HRESULT} 
     */
    Seek(eSeekOrigin, qwSeekOffset, dwSeekFlags, pqwCurrentPosition) {
        pqwCurrentPositionMarshal := pqwCurrentPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, SEEK_ORIGIN, eSeekOrigin, "uint", qwSeekOffset, "uint", dwSeekFlags, pqwCurrentPositionMarshal, pqwCurrentPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileIo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.SetLength := CallbackCreate(GetMethod(implObj, "SetLength"), flags, 2)
        this.vtbl.GetCurrentPosition := CallbackCreate(GetMethod(implObj, "GetCurrentPosition"), flags, 2)
        this.vtbl.SetCurrentPosition := CallbackCreate(GetMethod(implObj, "SetCurrentPosition"), flags, 2)
        this.vtbl.IsEndOfStream := CallbackCreate(GetMethod(implObj, "IsEndOfStream"), flags, 2)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 4)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 5)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.SetLength)
        CallbackFree(this.vtbl.GetCurrentPosition)
        CallbackFree(this.vtbl.SetCurrentPosition)
        CallbackFree(this.vtbl.IsEndOfStream)
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Seek)
        CallbackFree(this.vtbl.Close)
    }
}
