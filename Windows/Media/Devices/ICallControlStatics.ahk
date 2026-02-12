#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CallControl.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ICallControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallControlStatics
     * @type {Guid}
     */
    static IID => Guid("{03945ad5-85ab-40e1-af19-56c94303b019}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefault", "FromId"]

    /**
     * Retrieves the default configuration for the specified communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {CallControl} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getdefaultcommconfigw
     */
    GetDefault() {
        result := ComCall(6, this, "ptr*", &callControl_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CallControl(callControl_)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {CallControl} 
     */
    FromId(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr*", &callControl_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CallControl(callControl_)
    }
}
