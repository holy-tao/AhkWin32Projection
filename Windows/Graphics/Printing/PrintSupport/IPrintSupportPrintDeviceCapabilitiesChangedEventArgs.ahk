#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintDeviceCapabilitiesChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintDeviceCapabilitiesChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{15969bf0-9028-5722-8a37-7d7c34b41dd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentPrintDeviceCapabilities", "UpdatePrintDeviceCapabilities", "GetDeferral"]

    /**
     * 
     * @returns {XmlDocument} 
     */
    GetCurrentPrintDeviceCapabilities() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(result_)
    }

    /**
     * 
     * @param {XmlDocument} updatedPdc 
     * @returns {HRESULT} 
     */
    UpdatePrintDeviceCapabilities(updatedPdc) {
        result := ComCall(7, this, "ptr", updatedPdc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
