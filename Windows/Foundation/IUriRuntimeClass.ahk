#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\WwwFormUrlDecoder.ahk
#Include .\Uri.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IUriRuntimeClass extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriRuntimeClass
     * @type {Guid}
     */
    static IID => Guid("{9e365e57-48b2-4160-956f-c7385120bbfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AbsoluteUri", "get_DisplayUri", "get_Domain", "get_Extension", "get_Fragment", "get_Host", "get_Password", "get_Path", "get_Query", "get_QueryParsed", "get_RawUri", "get_SchemeName", "get_UserName", "get_Port", "get_Suspicious", "Equals", "CombineUri"]

    /**
     * @type {HSTRING} 
     */
    AbsoluteUri {
        get => this.get_AbsoluteUri()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayUri {
        get => this.get_DisplayUri()
    }

    /**
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * @type {HSTRING} 
     */
    Extension {
        get => this.get_Extension()
    }

    /**
     * @type {HSTRING} 
     */
    Fragment {
        get => this.get_Fragment()
    }

    /**
     * @type {HSTRING} 
     */
    Host {
        get => this.get_Host()
    }

    /**
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
    }

    /**
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {HSTRING} 
     */
    Query {
        get => this.get_Query()
    }

    /**
     * @type {WwwFormUrlDecoder} 
     */
    QueryParsed {
        get => this.get_QueryParsed()
    }

    /**
     * @type {HSTRING} 
     */
    RawUri {
        get => this.get_RawUri()
    }

    /**
     * @type {HSTRING} 
     */
    SchemeName {
        get => this.get_SchemeName()
    }

    /**
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {Integer} 
     */
    Port {
        get => this.get_Port()
    }

    /**
     * @type {Boolean} 
     */
    Suspicious {
        get => this.get_Suspicious()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AbsoluteUri() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayUri() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Extension() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Fragment() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Host() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Query() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WwwFormUrlDecoder} 
     */
    get_QueryParsed() {
        result := ComCall(15, this, "ptr*", &ppWwwFormUrlDecoder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WwwFormUrlDecoder(ppWwwFormUrlDecoder)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RawUri() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SchemeName() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Port() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Suspicious() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Uri} pUri 
     * @returns {Boolean} 
     */
    Equals(pUri) {
        result := ComCall(21, this, "ptr", pUri, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} relativeUri 
     * @returns {Uri} 
     */
    CombineUri(relativeUri) {
        if(relativeUri is String) {
            pin := HSTRING.Create(relativeUri)
            relativeUri := pin.Value
        }
        relativeUri := relativeUri is Win32Handle ? NumGet(relativeUri, "ptr") : relativeUri

        result := ComCall(22, this, "ptr", relativeUri, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(instance)
    }
}
