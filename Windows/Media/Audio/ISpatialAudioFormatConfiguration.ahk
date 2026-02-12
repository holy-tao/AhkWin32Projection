#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class ISpatialAudioFormatConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioFormatConfiguration
     * @type {Guid}
     */
    static IID => Guid("{32df09a8-50f0-5395-9923-7d44ca71ed6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportLicenseChangedAsync", "ReportConfigurationChangedAsync", "get_MixedRealityExclusiveModePolicy", "put_MixedRealityExclusiveModePolicy"]

    /**
     * @type {Integer} 
     */
    MixedRealityExclusiveModePolicy {
        get => this.get_MixedRealityExclusiveModePolicy()
        set => this.put_MixedRealityExclusiveModePolicy(value)
    }

    /**
     * 
     * @param {HSTRING} subtype 
     * @returns {IAsyncAction} 
     */
    ReportLicenseChangedAsync(subtype) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype

        result := ComCall(6, this, "ptr", subtype, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} subtype 
     * @returns {IAsyncAction} 
     */
    ReportConfigurationChangedAsync(subtype) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype

        result := ComCall(7, this, "ptr", subtype, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MixedRealityExclusiveModePolicy() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MixedRealityExclusiveModePolicy(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
