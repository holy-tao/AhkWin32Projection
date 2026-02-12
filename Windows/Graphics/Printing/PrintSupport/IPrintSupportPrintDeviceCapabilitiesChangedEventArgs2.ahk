#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintDeviceCapabilitiesChangedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{469df9e7-fd07-5eeb-a07d-9fcc67f089ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSupportedPdlPassthroughContentTypes", "get_ResourceLanguage", "GetCurrentPrintDeviceResources", "UpdatePrintDeviceResources", "SetPrintDeviceCapabilitiesUpdatePolicy"]

    /**
     * @type {HSTRING} 
     */
    ResourceLanguage {
        get => this.get_ResourceLanguage()
    }

    /**
     * 
     * @param {IIterable<HSTRING>} supportedPdlContentTypes 
     * @returns {HRESULT} 
     */
    SetSupportedPdlPassthroughContentTypes(supportedPdlContentTypes) {
        result := ComCall(6, this, "ptr", supportedPdlContentTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceLanguage() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    GetCurrentPrintDeviceResources() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(result_)
    }

    /**
     * 
     * @param {XmlDocument} updatedPdr 
     * @returns {HRESULT} 
     */
    UpdatePrintDeviceResources(updatedPdr) {
        result := ComCall(9, this, "ptr", updatedPdr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PrintSupportPrintDeviceCapabilitiesUpdatePolicy} updatePolicy 
     * @returns {HRESULT} 
     */
    SetPrintDeviceCapabilitiesUpdatePolicy(updatePolicy) {
        result := ComCall(10, this, "ptr", updatePolicy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
