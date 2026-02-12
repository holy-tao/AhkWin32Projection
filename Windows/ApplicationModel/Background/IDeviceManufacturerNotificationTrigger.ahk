#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IDeviceManufacturerNotificationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceManufacturerNotificationTrigger
     * @type {Guid}
     */
    static IID => Guid("{81278ab5-41ab-16da-86c2-7f7bf0912f5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TriggerQualifier", "get_OneShot"]

    /**
     * @type {HSTRING} 
     */
    TriggerQualifier {
        get => this.get_TriggerQualifier()
    }

    /**
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TriggerQualifier() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        result := ComCall(7, this, "int*", &oneShot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return oneShot
    }
}
