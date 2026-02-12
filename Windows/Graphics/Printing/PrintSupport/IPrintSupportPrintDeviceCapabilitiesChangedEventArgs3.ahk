#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintSupportIppCommunicationConfiguration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintDeviceCapabilitiesChangedEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{d4e9b3fc-8094-5cb6-a343-ce7a97187b45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommunicationConfiguration"]

    /**
     * @type {PrintSupportIppCommunicationConfiguration} 
     */
    CommunicationConfiguration {
        get => this.get_CommunicationConfiguration()
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationConfiguration} 
     */
    get_CommunicationConfiguration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintSupportIppCommunicationConfiguration(value)
    }
}
