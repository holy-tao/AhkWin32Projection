#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FILE_ACCESSMODE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\SEEK_ORIGIN.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\FILE_OPENMODE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class IFileIo extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileIo
     * @type {Guid}
     */
    static IID => Guid("{11993196-1244-4840-ab44-480975c4ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetLength", "SetLength", "GetCurrentPosition", "SetCurrentPosition", "IsEndOfStream", "Read", "Write", "Seek", "Close"]

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

        result := ComCall(3, this, "int", eAccessMode, "int", eOpenMode, "ptr", pwszFileName, "HRESULT")
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

        result := ComCall(11, this, "int", eSeekOrigin, "uint", qwSeekOffset, "uint", dwSeekFlags, pqwCurrentPositionMarshal, pqwCurrentPosition, "HRESULT")
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
}
