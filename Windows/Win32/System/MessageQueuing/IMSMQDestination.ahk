#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQDestination extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQDestination
     * @type {Guid}
     */
    static IID => Guid("{eba96b16-2168-11d3-898c-00e02c074f6b}")

    /**
     * The class identifier for MSMQDestination
     * @type {Guid}
     */
    static CLSID => Guid("{eba96b18-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "get_IsOpen", "get_IADs", "putref_IADs", "get_ADsPath", "put_ADsPath", "get_PathName", "put_PathName", "get_FormatName", "put_FormatName", "get_Destinations", "putref_Destinations", "get_Properties"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * @type {IDispatch} 
     */
    IADs {
        get => this.get_IADs()
    }

    /**
     * @type {BSTR} 
     */
    ADsPath {
        get => this.get_ADsPath()
        set => this.put_ADsPath(value)
    }

    /**
     * @type {BSTR} 
     */
    PathName {
        get => this.get_PathName()
        set => this.put_PathName(value)
    }

    /**
     * @type {BSTR} 
     */
    FormatName {
        get => this.get_FormatName()
        set => this.put_FormatName(value)
    }

    /**
     * @type {IDispatch} 
     */
    Destinations {
        get => this.get_Destinations()
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function. (ANSI)
     * @remarks
     * If the backup filename specifies a remote server, the <i>lpUNCServerName</i> parameter must be <b>NULL</b>.
     * 
     * When this function is used on Windows Vista and later computers, only backup event logs that were saved with the <b>BackupEventLog</b> function on Windows Vista and later computers can be opened.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines OpenBackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openbackupeventloga
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
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
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsOpen() {
        result := ComCall(9, this, "short*", &pfIsOpen := 0, "HRESULT")
        return pfIsOpen
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_IADs() {
        result := ComCall(10, this, "ptr*", &ppIADs := 0, "HRESULT")
        return IDispatch(ppIADs)
    }

    /**
     * 
     * @param {IDispatch} pIADs 
     * @returns {HRESULT} 
     */
    putref_IADs(pIADs) {
        result := ComCall(11, this, "ptr", pIADs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ADsPath() {
        pbstrADsPath := BSTR()
        result := ComCall(12, this, "ptr", pbstrADsPath, "HRESULT")
        return pbstrADsPath
    }

    /**
     * 
     * @param {BSTR} bstrADsPath 
     * @returns {HRESULT} 
     */
    put_ADsPath(bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(13, this, "ptr", bstrADsPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PathName() {
        pbstrPathName := BSTR()
        result := ComCall(14, this, "ptr", pbstrPathName, "HRESULT")
        return pbstrPathName
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        bstrPathName := bstrPathName is String ? BSTR.Alloc(bstrPathName).Value : bstrPathName

        result := ComCall(15, this, "ptr", bstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR()
        result := ComCall(16, this, "ptr", pbstrFormatName, "HRESULT")
        return pbstrFormatName
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        bstrFormatName := bstrFormatName is String ? BSTR.Alloc(bstrFormatName).Value : bstrFormatName

        result := ComCall(17, this, "ptr", bstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Destinations() {
        result := ComCall(18, this, "ptr*", &ppDestinations := 0, "HRESULT")
        return IDispatch(ppDestinations)
    }

    /**
     * 
     * @param {IDispatch} pDestinations 
     * @returns {HRESULT} 
     */
    putref_Destinations(pDestinations) {
        result := ComCall(19, this, "ptr", pDestinations, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(20, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }
}
