#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintSupportMxdcImageQualityConfiguration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintDeviceCapabilitiesChangedEventArgs4
     * @type {Guid}
     */
    static IID => Guid("{31734ad5-9bfb-5bfb-bdef-8476258e3390}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MxdcImageQualityConfiguration"]

    /**
     * @type {PrintSupportMxdcImageQualityConfiguration} 
     */
    MxdcImageQualityConfiguration {
        get => this.get_MxdcImageQualityConfiguration()
    }

    /**
     * 
     * @returns {PrintSupportMxdcImageQualityConfiguration} 
     */
    get_MxdcImageQualityConfiguration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintSupportMxdcImageQualityConfiguration(value)
    }
}
