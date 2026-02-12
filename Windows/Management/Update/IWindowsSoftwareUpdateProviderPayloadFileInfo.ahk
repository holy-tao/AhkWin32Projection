#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateProviderPayloadFileInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateProviderPayloadFileInfo
     * @type {Guid}
     */
    static IID => Guid("{f1da16da-1b01-5367-b4ae-20db8cae1e9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Filename", "get_FileHash", "get_CatalogFile", "get_TrustState"]

    /**
     * @type {HSTRING} 
     */
    Filename {
        get => this.get_Filename()
    }

    /**
     * @type {HSTRING} 
     */
    FileHash {
        get => this.get_FileHash()
    }

    /**
     * @type {HSTRING} 
     */
    CatalogFile {
        get => this.get_CatalogFile()
    }

    /**
     * @type {Integer} 
     */
    TrustState {
        get => this.get_TrustState()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Filename() {
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
    get_FileHash() {
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
    get_CatalogFile() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrustState() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
