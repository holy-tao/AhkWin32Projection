#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CastingDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingDeviceSelectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingDeviceSelectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{dc439e86-dd57-4d0d-9400-af45e4fb3663}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedCastingDevice"]

    /**
     * @type {CastingDevice} 
     */
    SelectedCastingDevice {
        get => this.get_SelectedCastingDevice()
    }

    /**
     * 
     * @returns {CastingDevice} 
     */
    get_SelectedCastingDevice() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CastingDevice(value)
    }
}
