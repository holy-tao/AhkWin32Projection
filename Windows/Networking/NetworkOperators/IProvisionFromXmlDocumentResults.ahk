#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IProvisionFromXmlDocumentResults extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvisionFromXmlDocumentResults
     * @type {Guid}
     */
    static IID => Guid("{217700e0-8203-11df-adb9-f4ce462d9137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllElementsProvisioned", "get_ProvisionResultsXml"]

    /**
     * @type {Boolean} 
     */
    AllElementsProvisioned {
        get => this.get_AllElementsProvisioned()
    }

    /**
     * @type {HSTRING} 
     */
    ProvisionResultsXml {
        get => this.get_ProvisionResultsXml()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllElementsProvisioned() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProvisionResultsXml() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
