#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ITimeZoneSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeZoneSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{9b3b2bea-a101-41ae-9fbd-028728bab73d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentTimeZoneDisplayName", "get_SupportedTimeZoneDisplayNames", "get_CanChangeTimeZone", "ChangeTimeZoneByDisplayName"]

    /**
     * @type {HSTRING} 
     */
    CurrentTimeZoneDisplayName {
        get => this.get_CurrentTimeZoneDisplayName()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SupportedTimeZoneDisplayNames {
        get => this.get_SupportedTimeZoneDisplayNames()
    }

    /**
     * @type {Boolean} 
     */
    CanChangeTimeZone {
        get => this.get_CanChangeTimeZone()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrentTimeZoneDisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedTimeZoneDisplayNames() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanChangeTimeZone() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} timeZoneDisplayName 
     * @returns {HRESULT} 
     */
    ChangeTimeZoneByDisplayName(timeZoneDisplayName) {
        if(timeZoneDisplayName is String) {
            pin := HSTRING.Create(timeZoneDisplayName)
            timeZoneDisplayName := pin.Value
        }
        timeZoneDisplayName := timeZoneDisplayName is Win32Handle ? NumGet(timeZoneDisplayName, "ptr") : timeZoneDisplayName

        result := ComCall(9, this, "ptr", timeZoneDisplayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
