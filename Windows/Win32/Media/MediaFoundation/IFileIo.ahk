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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(eAccessMode, eOpenMode, pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "int", eAccessMode, "int", eOpenMode, "ptr", pwszFileName, "HRESULT")
        return result
    }

    /**
     * Returns the length, in bytes, of a valid security identifier (SID).
     * @param {Pointer<Integer>} pqwLength 
     * @returns {HRESULT} If the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is valid, the return value is the length, in bytes, of the <b>SID</b> structure.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid, the return value is undefined. Before calling <b>GetLengthSid</b>, pass the SID to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the SID is valid.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getlengthsid
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
     * The GetCurrentPositionEx function retrieves the current position in logical coordinates.
     * @param {Pointer<Integer>} pqwPosition 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getcurrentpositionex
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
     * The ReadBlobFromFile function reads a BLOB in a file.
     * @param {Pointer<Integer>} pbt 
     * @param {Integer} ul 
     * @param {Pointer<Integer>} pulRead 
     * @returns {HRESULT} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/readblobfromfile
     */
    Read(pbt, ul, pulRead) {
        pbtMarshal := pbt is VarRef ? "char*" : "ptr"
        pulReadMarshal := pulRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pbtMarshal, pbt, "uint", ul, pulReadMarshal, pulRead, "HRESULT")
        return result
    }

    /**
     * The WriteBackRootHintDatafile method writes the RootHints back to the DNS Cache file.
     * @param {Pointer<Integer>} pbt 
     * @param {Integer} ul 
     * @param {Pointer<Integer>} pulWritten 
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/DNS/microsoftdns-roothints-writebackroothintdatafile
     */
    Write(pbt, ul, pulWritten) {
        pbtMarshal := pbt is VarRef ? "char*" : "ptr"
        pulWrittenMarshal := pulWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pbtMarshal, pbt, "uint", ul, pulWrittenMarshal, pulWritten, "HRESULT")
        return result
    }

    /**
     * The Seekable attribute is a file-level attribute specifying whether an application can seek to points within the content.
     * @remarks
     * This is a coded attribute.
     * 
     * This attribute cannot be duplicated at the file level. If this attribute is used for an individual stream, it will be treated as custom metadata and will not convey its normal meaning to the objects of the Windows Media Format SDK.
     * 
     * The value of this attribute for a file may vary depending upon the object exposing the [**IWMHeaderInfo**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo) or [**IWMHeaderInfo3**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo3) interface used to retrieve it. This is because the reader objects (both synchronous and asynchronous) perform a more thorough check than the metadata editor object does, to ascertain whether you can seek to a point in a file. The **Seekable** attribute value returned by a reader object is more accurate.
     * @param {Integer} eSeekOrigin 
     * @param {Integer} qwSeekOffset 
     * @param {Integer} dwSeekFlags 
     * @param {Pointer<Integer>} pqwCurrentPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/seekable
     */
    Seek(eSeekOrigin, qwSeekOffset, dwSeekFlags, pqwCurrentPosition) {
        pqwCurrentPositionMarshal := pqwCurrentPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "int", eSeekOrigin, "uint", qwSeekOffset, "uint", dwSeekFlags, pqwCurrentPositionMarshal, pqwCurrentPosition, "HRESULT")
        return result
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
     */
    Close() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
