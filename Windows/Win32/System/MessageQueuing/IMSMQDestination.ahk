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
     * Open Method (ADO MD)
     * @remarks
     * The **Open** method generates an error if either of its parameters is omitted and its corresponding property value has not been set prior to attempting to open the **Cellset**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/open-method-ado-md
     */
    Open() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsOpen() {
        result := ComCall(9, this, "short*", &pfIsOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfIsOpen
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_IADs() {
        result := ComCall(10, this, "ptr*", &ppIADs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppIADs)
    }

    /**
     * 
     * @param {IDispatch} pIADs 
     * @returns {HRESULT} 
     */
    putref_IADs(pIADs) {
        result := ComCall(11, this, "ptr", pIADs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ADsPath() {
        pbstrADsPath := BSTR()
        result := ComCall(12, this, "ptr", pbstrADsPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrADsPath
    }

    /**
     * 
     * @param {BSTR} bstrADsPath 
     * @returns {HRESULT} 
     */
    put_ADsPath(bstrADsPath) {
        if(bstrADsPath is String) {
            pin := BSTR.Alloc(bstrADsPath)
            bstrADsPath := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrADsPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PathName() {
        pbstrPathName := BSTR()
        result := ComCall(14, this, "ptr", pbstrPathName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPathName
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        if(bstrPathName is String) {
            pin := BSTR.Alloc(bstrPathName)
            bstrPathName := pin.Value
        }

        result := ComCall(15, this, "ptr", bstrPathName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR()
        result := ComCall(16, this, "ptr", pbstrFormatName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFormatName
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        if(bstrFormatName is String) {
            pin := BSTR.Alloc(bstrFormatName)
            bstrFormatName := pin.Value
        }

        result := ComCall(17, this, "ptr", bstrFormatName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Destinations() {
        result := ComCall(18, this, "ptr*", &ppDestinations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppDestinations)
    }

    /**
     * 
     * @param {IDispatch} pDestinations 
     * @returns {HRESULT} 
     */
    putref_Destinations(pDestinations) {
        result := ComCall(19, this, "ptr", pDestinations, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(20, this, "ptr*", &ppcolProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppcolProperties)
    }
}
