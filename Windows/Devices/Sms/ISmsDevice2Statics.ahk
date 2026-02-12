#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmsDevice2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsDevice2Statics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsDevice2Statics
     * @type {Guid}
     */
    static IID => Guid("{65c78325-1031-491e-8fb6-ef9991afe363}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "FromId", "GetDefault", "FromParentId"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {SmsDevice2} 
     */
    FromId(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsDevice2(value)
    }

    /**
     * Retrieves the default configuration for the specified communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {SmsDevice2} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getdefaultcommconfigw
     */
    GetDefault() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsDevice2(value)
    }

    /**
     * 
     * @param {HSTRING} parentDeviceId 
     * @returns {SmsDevice2} 
     */
    FromParentId(parentDeviceId) {
        if(parentDeviceId is String) {
            pin := HSTRING.Create(parentDeviceId)
            parentDeviceId := pin.Value
        }
        parentDeviceId := parentDeviceId is Win32Handle ? NumGet(parentDeviceId, "ptr") : parentDeviceId

        result := ComCall(9, this, "ptr", parentDeviceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsDevice2(value)
    }
}
