#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IFileIo extends IUnknown{

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
     * @param {Integer} eAccessMode 
     * @param {Integer} eOpenMode 
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
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
        result := ComCall(4, this, "uint*", pqwLength, "HRESULT")
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
        result := ComCall(6, this, "uint*", pqwPosition, "HRESULT")
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
        result := ComCall(8, this, "ptr", pbEndOfStream, "HRESULT")
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
        result := ComCall(9, this, "char*", pbt, "uint", ul, "uint*", pulRead, "HRESULT")
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
        result := ComCall(10, this, "char*", pbt, "uint", ul, "uint*", pulWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eSeekOrigin 
     * @param {Integer} qwSeekOffset 
     * @param {Integer} dwSeekFlags 
     * @param {Pointer<Integer>} pqwCurrentPosition 
     * @returns {HRESULT} 
     */
    Seek(eSeekOrigin, qwSeekOffset, dwSeekFlags, pqwCurrentPosition) {
        result := ComCall(11, this, "int", eSeekOrigin, "uint", qwSeekOffset, "uint", dwSeekFlags, "uint*", pqwCurrentPosition, "HRESULT")
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
