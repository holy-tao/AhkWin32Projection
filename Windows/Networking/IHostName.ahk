#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include Connectivity\IPInformation.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class IHostName extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostName
     * @type {Guid}
     */
    static IID => Guid("{bf8ecaad-ed96-49a7-9084-d416cae88dcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IPInformation", "get_RawName", "get_DisplayName", "get_CanonicalName", "get_Type", "IsEqual"]

    /**
     * @type {IPInformation} 
     */
    IPInformation {
        get => this.get_IPInformation()
    }

    /**
     * @type {HSTRING} 
     */
    RawName {
        get => this.get_RawName()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    CanonicalName {
        get => this.get_CanonicalName()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {IPInformation} 
     */
    get_IPInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPInformation(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RawName() {
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
    get_DisplayName() {
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
    get_CanonicalName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Evaluates to a Boolean value that indicates whether two CLSIDs are equal.
     * @param {HostName} hostName_ 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/guiddef/nf-guiddef-isequalclsid
     */
    IsEqual(hostName_) {
        result := ComCall(11, this, "ptr", hostName_, "int*", &isEqual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isEqual
    }
}
