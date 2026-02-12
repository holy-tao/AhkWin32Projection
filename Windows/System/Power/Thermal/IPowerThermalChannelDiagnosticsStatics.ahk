#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PowerThermalChannelDiagnostics.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class IPowerThermalChannelDiagnosticsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerThermalChannelDiagnosticsStatics
     * @type {Guid}
     */
    static IID => Guid("{a86ec393-b684-5633-a6ca-dfa1c7eecf87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "GetDataForChannels"]

    /**
     * @type {PowerThermalChannelDiagnostics} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {PowerThermalChannelDiagnostics} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PowerThermalChannelDiagnostics(value)
    }

    /**
     * 
     * @param {Integer} channelIds_length 
     * @param {Pointer<PowerThermalChannelId>} channelIds 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetDataForChannels(channelIds_length, channelIds, result_) {
        result := ComCall(7, this, "uint", channelIds_length, "ptr", channelIds, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
