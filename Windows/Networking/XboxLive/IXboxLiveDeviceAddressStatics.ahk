#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveDeviceAddressStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveDeviceAddressStatics
     * @type {Guid}
     */
    static IID => Guid("{5954a819-4a79-4931-827c-7f503e963263}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromSnapshotBase64", "CreateFromSnapshotBuffer", "CreateFromSnapshotBytes", "GetLocal", "get_MaxSnapshotBytesSize"]

    /**
     * @type {Integer} 
     */
    MaxSnapshotBytesSize {
        get => this.get_MaxSnapshotBytesSize()
    }

    /**
     * 
     * @param {HSTRING} base64 
     * @returns {XboxLiveDeviceAddress} 
     */
    CreateFromSnapshotBase64(base64) {
        if(base64 is String) {
            pin := HSTRING.Create(base64)
            base64 := pin.Value
        }
        base64 := base64 is Win32Handle ? NumGet(base64, "ptr") : base64

        result := ComCall(6, this, "ptr", base64, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {XboxLiveDeviceAddress} 
     */
    CreateFromSnapshotBuffer(buffer_) {
        result := ComCall(7, this, "ptr", buffer_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer 
     * @returns {XboxLiveDeviceAddress} 
     */
    CreateFromSnapshotBytes(buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", buffer_length, bufferMarshal, buffer, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * Retrieves information about a locale specified by identifier. (Unicode)
     * @remarks
     * For the operation of this function, see Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getlocaleinfoex">GetLocaleInfoEx</a>.
     * 
     * <div class="alert"><b>Note</b>   Even when the <i>LCType</i> parameter is specified as LOCALE_FONTSIGNATURE, <i>cchData</i> and the function return are still TCHAR counts. The count is different for the ANSI and Unicode versions of the function. When an application calls the generic version of <b>GetLocaleInfo</b> with LOCALE_FONTSIGNATURE, <i>cchData</i> can be safely specified as sizeof(LOCALESIGNATURE) / sizeof(TCHAR).</div>
     * <div> </div>
     * The following examples deal correctly with the buffer size for non-text values:
     * 
     * 
     * ```cpp
     * int   ret;
     * CALID calid;
     * DWORD value;
     * 
     * ret = GetLocaleInfo(LOCALE_USER_DEFAULT,
     *                     LOCALE_ICALENDARTYPE | LOCALE_RETURN_NUMBER,
     *                     (LPTSTR)&value,
     *                     sizeof(value) / sizeof(TCHAR) );
     * calid = value;
     * 
     * LOCALESIGNATURE LocSig;
     * 
     * ret = GetLocaleInfo(LOCALE_USER_DEFAULT,
     *                     LOCALE_FONTSIGNATURE,
     *                     (LPWSTR)&LocSig,
     *                     sizeof(LocSig) / sizeof(TCHAR) );
     * 
     * ```
     * 
     * 
     * The ANSI string retrieved by the ANSI version of this function is translated from Unicode to ANSI based on the default ANSI code page for the locale identifier. However, if <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-use-cp-acp">LOCALE_USE_CP_ACP</a> is specified, the translation is based on the system default ANSI code page.
     * 
     * When the ANSI version of this function is used with a Unicode-only locale identifier, the function can succeed because the operating system uses the system code page. However, characters that are undefined in the system code page appear in the string as a question mark (?). 
     *       
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winnls.h header defines GetLocaleInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {XboxLiveDeviceAddress} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winnls/nf-winnls-getlocaleinfow
     */
    GetLocal() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSnapshotBytesSize() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
